import 'package:equatable/equatable.dart';

abstract class PopularPostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPopular extends PopularPostEvent {}

class RefreshPopular extends PopularPostEvent {}