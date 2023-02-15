part of 'friends_data_save_bloc.dart';

abstract class FriendsDataSaveState extends Equatable {
  const FriendsDataSaveState();

  @override
  List<Object> get props => [];
}

class FriendsDataSaveInitial extends FriendsDataSaveState {}

class FriendsDataSaveLoading extends FriendsDataSaveState {}

class FriendsDataSaveLoaded extends FriendsDataSaveState {
  final List<FriendData> friendData;
  const FriendsDataSaveLoaded(this.friendData);
}

class FriendsDataSaveFailure extends FriendsDataSaveState {
  final String message;
  const FriendsDataSaveFailure(this.message);
}
