import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';

import 'package:municippa/services/db.dart';
import 'package:municippa/bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RecentPostBloc extends Bloc<RecentPostEvent, RecentPostState> {
  final DbService db;

  RecentPostBloc({@required this.db});

  @override
  Stream<RecentPostState> transformEvents(
      Stream<RecentPostEvent> events,
      Stream<RecentPostState> Function(RecentPostEvent event) next,
      ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  get initialState => RecentPostUninitialized();

  @override
  Stream<RecentPostState> mapEventToState(event) async* {
    final currentState = state;
    if (event is FetchRecent && !_hasReachedMax(currentState)) {
      try {
        if (currentState is RecentPostUninitialized) {
          final postsAndLastDoc = await _fetchPosts(null, 4);
          yield RecentPostLoaded(posts: postsAndLastDoc[0], hasReachedMax: false, lastDoc: postsAndLastDoc[1]);
        }
        if (currentState is RecentPostLoaded) {
          final postsAndLastDoc = await _fetchPosts(currentState.lastDoc, 4);
          yield postsAndLastDoc[0].isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : RecentPostLoaded(
              posts: currentState.posts + postsAndLastDoc[0], hasReachedMax: false, lastDoc : postsAndLastDoc[1]);
        }
      } catch (_) {
        yield RecentPostError();
      }
    }

    if(event is RefreshRecent){
      try {
        final postsAndLastDoc = await _fetchPosts(null, 4);
        yield RecentPostLoaded(posts: postsAndLastDoc[0], hasReachedMax: false, lastDoc: null);
      }  catch (e) {
        yield RecentPostError();
      }
    }
  }

  bool _hasReachedMax(RecentPostState state) =>
      state is RecentPostLoaded && state.hasReachedMax;

  _fetchPosts(DocumentSnapshot lastDoc, int limit) async {

    print("fetching posts");
    final postsAndLastDoc = await db.getRecentPosts(lastDoc, limit);
    print("postsandlastdoc: $postsAndLastDoc");
    return postsAndLastDoc;

  }

}