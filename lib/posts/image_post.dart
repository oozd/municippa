import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';

class ImagePost extends Equatable{
  final String docId;
  final String userId;
  final String title;
  final String post;
  final String location;
  final DateTime postDate;
  final int absVote;
  final String imageURL;

  const ImagePost(
      {Key key, this.docId, this.userId, this.title, this.post, this.location, this.postDate, this.absVote, this.imageURL});

  @override
  List<Object> get props => [docId, userId, title, post, location, postDate, absVote, imageURL];

  @override
  String toString() => 'Post { id: $docId }';

}
