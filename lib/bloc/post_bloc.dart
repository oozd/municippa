import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';

import 'package:municippa/services/db.dart';
import 'package:municippa/bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final DbService db;

  PostBloc({@required this.db});

  @override
  Stream<PostState> transformEvents(
      Stream<PostEvent> events,
      Stream<PostState> Function(PostEvent event) next,
      ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(event) async* {
    final currentState = state;
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostUninitialized) {
          final postsAndLastDoc = await _fetchPosts(null, 4);
          yield PostLoaded(posts: postsAndLastDoc[0], hasReachedMax: false, lastDoc: postsAndLastDoc[1]);
        }
        if (currentState is PostLoaded) {
          final postsAndLastDoc = await _fetchPosts(currentState.lastDoc, 4);
          yield postsAndLastDoc[0].isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostLoaded(
              posts: currentState.posts + postsAndLastDoc[0], hasReachedMax: false, lastDoc : postsAndLastDoc[1]);
        }
      } catch (_) {
        yield PostError();
      }
    }

    if(event is Refresh){
      try {
        final postsAndLastDoc = await _fetchPosts(null, 4);
        yield PostLoaded(posts: postsAndLastDoc[0], hasReachedMax: false, lastDoc: null);
      }  catch (e) {
        yield PostError();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostLoaded && state.hasReachedMax;

  _fetchPosts(DocumentSnapshot lastDoc, int limit) async {

    print("fetching posts");
    final postsAndLastDoc = await db.getRecentPosts(lastDoc, limit);
    print("postsandlastdoc: $postsAndLastDoc");
    return postsAndLastDoc;

  }

}