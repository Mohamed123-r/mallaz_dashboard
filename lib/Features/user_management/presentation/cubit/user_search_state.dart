part of 'user_search_cubit.dart';

abstract class UserSearchState {}

class UserSearchInitial extends UserSearchState {}

class UserSearchLoading extends UserSearchState {}

class UserSearchSuccess extends UserSearchState {
  final UserSearchModel userSearchModel;

  UserSearchSuccess({required this.userSearchModel});
}

class UserSearchFailure extends UserSearchState {
  final String error;

  UserSearchFailure({required this.error});
}