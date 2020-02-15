import 'package:equatable/equatable.dart';
import 'package:municippa/posts/image_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:municippa/models/models.dart';

abstract class RecentPostState extends Equatable {
  const RecentPostState();

  @override
  List<Object> get props => [];
}

class RecentPostUninitialized extends RecentPostState {
}

class RecentPostError extends RecentPostState {
}

class RecentPostLoaded extends RecentPostState {
  final List<ImagePost> posts;
  final bool hasReachedMax;
  final DocumentSnapshot lastDoc;

  const RecentPostLoaded({
    this.posts,
    this.hasReachedMax,
    this.lastDoc,
  });

  RecentPostLoaded copyWith({
    List<ImagePost> posts,
    bool hasReachedMax,
    DocumentSnapshot lastDoc,

  }) {
    return RecentPostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      lastDoc: lastDoc ?? this.lastDoc,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax, lastDoc];

  @override
  String toString() =>
      'RecentPostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax, lastDoc: $lastDoc}';
}