import 'package:equatable/equatable.dart';
import 'package:municippa/posts/image_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:municippa/models/models.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostUninitialized extends PostState {
}

class PostError extends PostState {
}

class PostLoaded extends PostState {
  final List<ImagePost> posts;
  final bool hasReachedMax;
  final DocumentSnapshot lastDoc;

  const PostLoaded({
    this.posts,
    this.hasReachedMax,
    this.lastDoc,
  });

  PostLoaded copyWith({
    List<ImagePost> posts,
    bool hasReachedMax,
    DocumentSnapshot lastDoc,

  }) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      lastDoc: lastDoc ?? this.lastDoc,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax, lastDoc];

  @override
  String toString() =>
      'PostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax, lastDoc: $lastDoc}';
}