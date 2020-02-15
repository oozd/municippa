import 'package:equatable/equatable.dart';

abstract class RecentPostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchRecent extends RecentPostEvent {}

class RefreshRecent extends RecentPostEvent {}