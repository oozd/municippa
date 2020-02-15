import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';

import 'package:municippa/services/db.dart';
import 'package:municippa/bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class PopularPostBloc extends Bloc<PopularPostEvent, PopularPostState> {
  final DbService db;

  PopularPostBloc({@required this.db});

  @override
  Stream<PopularPostState> transformEvents(
      Stream<PopularPostEvent> events,
      Stream<PopularPostState> Function(PopularPostEvent event) next,
      ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  get initialState => PopularPostUninitialized();

  @override
  Stream<PopularPostState> mapEventToState(event) async* {
    final currentState = state;
    if (event is FetchPopular && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PopularPostUninitialized) {
          final postsAndLastDoc = await _fetchPosts(null, 4);
          yield PopularPostLoaded(posts: postsAndLastDoc[0], hasReachedMax: false, lastDoc: postsAndLastDoc[1]);
        }
        if (currentState is PopularPostLoaded) {
          final postsAndLastDoc = await _fetchPosts(currentState.lastDoc, 4);
          yield postsAndLastDoc[0].isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PopularPostLoaded(
              posts: currentState.posts + postsAndLastDoc[0], hasReachedMax: false, lastDoc : postsAndLastDoc[1]);
        }
      } catch (_) {
        yield PopularPostError();
      }
    }

    if(event is RefreshPopular){
      try {
        final postsAndLastDoc = await _fetchPosts(null, 4);
        yield PopularPostLoaded(posts: postsAndLastDoc[0], hasReachedMax: false, lastDoc: null);
      }  catch (e) {
        yield PopularPostError();
      }
    }
  }

  bool _hasReachedMax(PopularPostState state) =>
      state is PopularPostLoaded && state.hasReachedMax;

  _fetchPosts(DocumentSnapshot lastDoc, int limit) async {

    print("fetching posts");
    final postsAndLastDoc = await db.getPopularPosts(lastDoc, limit);
    print("postsandlastdoc: $postsAndLastDoc");
    return postsAndLastDoc;

  }

}