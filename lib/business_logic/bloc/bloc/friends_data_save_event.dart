part of 'friends_data_save_bloc.dart';

abstract class FriendsDataSaveEvent extends Equatable {
  const FriendsDataSaveEvent();

  @override
  List<Object> get props => [];
}

class AddFriendEvent extends FriendsDataSaveEvent {
  final FriendData friendData;
  const AddFriendEvent(this.friendData);
}

class UpdateFriendEvent extends FriendsDataSaveEvent {
  final FriendData friendData;
  final int id;
  const UpdateFriendEvent(this.friendData, this.id);
}

class RemoveFriendEvent extends FriendsDataSaveEvent {
  final Map<String,dynamic> data;
  const RemoveFriendEvent(this.data);
}

class GetFriendEvent extends FriendsDataSaveEvent {}

class SearchFriendEvent extends FriendsDataSaveEvent {
  final String firstName;
  const SearchFriendEvent(this.firstName);
}
