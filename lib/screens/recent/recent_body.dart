import 'package:flutter/material.dart';
import 'package:municippa/posts/image_post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:municippa/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:municippa/widgets/bottom_loader.dart';
import 'package:municippa/widgets/post_widget.dart';

class RecentBody extends StatefulWidget {
  @override
  _RecentBodyState createState() => _RecentBodyState();
}


class _RecentBodyState extends State<RecentBody> {

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<PostBloc>(context);
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostError) {
          return Center(
            child: Text('failed to fetch posts'),
          );
        }
        if (state is PostLoaded) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text('no posts'),
            );
          }
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(), // otherwise refreshIndicator does not work
              itemBuilder: (BuildContext context, int index) {
                return index >= state.posts.length
                    ? BottomLoader()
                    : PostWidget(imagePost: state.posts[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.posts.length
                  : state.posts.length + 1,
              controller: _scrollController,
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(Fetch());
    }
  }

  Future<void> _onRefresh() async {
    _postBloc.add(Refresh());
    await new Future.delayed(const Duration(seconds : 2));
    return ;
  }


}




