import 'package:equatable/equatable.dart';
import 'package:municippa/posts/image_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:municippa/models/models.dart';

abstract class PopularPostState extends Equatable {
  const PopularPostState();

  @override
  List<Object> get props => [];
}

class PopularPostUninitialized extends PopularPostState {
}

class PopularPostError extends PopularPostState {
}

class PopularPostLoaded extends PopularPostState {
  final List<ImagePost> posts;
  final bool hasReachedMax;
  final DocumentSnapshot lastDoc;

  const PopularPostLoaded({
    this.posts,
    this.hasReachedMax,
    this.lastDoc,
  });

  PopularPostLoaded copyWith({
    List<ImagePost> posts,
    bool hasReachedMax,
    DocumentSnapshot lastDoc,

  }) {
    return PopularPostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      lastDoc: lastDoc ?? this.lastDoc,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax, lastDoc];

  @override
  String toString() =>
      'PopularPostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax, lastDoc: $lastDoc}';
}