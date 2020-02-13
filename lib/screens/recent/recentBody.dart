import 'package:flutter/material.dart';
import 'package:municippa/posts/imagePost.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:municippa/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return ;
  }


}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}


class PostWidget extends StatelessWidget {
  final ImagePost imagePost;

  const PostWidget({Key key, @required this.imagePost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      color: Colors.white,
      child: Column(
        children: <Widget>[

          Row(
            children: <Widget>[
              Expanded(
                flex:4, // for icon vs right side of it.
                child: FittedBox(
                    child: Icon(Icons.account_circle, color: Colors.blue,)
                ),
              ),

              Expanded(
                flex: 30,
                child: Container(
                  child: Text("Posted By "),
                ),
              ),

              Spacer(flex: 30),

              Expanded(
                  flex: 18,
                  child: Text("Date")
              ),

            ],


          ),

          Row(
            children: <Widget>[

              Spacer(flex: 45),

              Expanded(
                flex:3, // for icon vs right side of it.
                child: FittedBox(
                    child: Icon(Icons.location_on, color: Colors.blue,)
                ),
              ),

              Expanded(
                flex: 10,
                child: Container(
                  child: Text("At ${imagePost.location} "),
                ),
              ),

            ],

          ),


          SizedBox(
            height: 10,
          ),

          Center(
              child: Text(
                imagePost.title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              )
          ),


          SizedBox(
            height: 10,
          ),


          new CachedNetworkImage(
            imageUrl: imagePost.imageURL,
            placeholder: (context, url) => Image.asset('packages/municippa/assets/images/blank.jpg', height: 800, width: 800),
          ),

          SizedBox(
            height: 10,
          ),

          Container(
              alignment: Alignment(-0.8, 0),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(imagePost.post, style: TextStyle(fontSize: 14),)),

          SizedBox(
            height: 10,
          ),


        ],
      ),
    );
  }
}