
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data/model/friend_data.dart';
import 'package:test_app/data/repository/friends_list_repository.dart';

part 'friends_data_save_event.dart';
part 'friends_data_save_state.dart';

class FriendsDataSaveBloc
    extends Bloc<FriendsDataSaveEvent, FriendsDataSaveState> {
  final FriendsListRepository friendsListRepository;
  FriendsDataSaveBloc(this.friendsListRepository)
      : super(FriendsDataSaveInitial()) {
    on<GetFriendEvent>((event, emit) async {
      try {
        await friendsListRepository.init();
        emit(FriendsDataSaveLoading());
        final friendsList = friendsListRepository.getAllFriends();
        if (friendsList.isNotEmpty) {
          emit(FriendsDataSaveLoaded(friendsList));
        } else {
          emit(const FriendsDataSaveFailure("Your Friend list are empty!"));
        }
      } catch (e) {
        emit(FriendsDataSaveFailure(e.toString()));
      }
    });
    on<AddFriendEvent>((event, emit) async {
      try {
        await friendsListRepository.init();

        emit(FriendsDataSaveLoading());
        friendsListRepository.addFriends(event.friendData);
     
      } catch (e) {
        emit(FriendsDataSaveFailure(e.toString()));
      }
    });
    on<UpdateFriendEvent>((event, emit) async {
      try {
        await friendsListRepository.init();

        emit(FriendsDataSaveLoading());
        final data = await friendsListRepository
            .updateTask(
          event.id,
          event.friendData,
        );
      } catch (e) {
        emit(FriendsDataSaveFailure(e.toString()));
      }
    });
    on<RemoveFriendEvent>((event, emit) async {
      try {
        await friendsListRepository.init();

        emit(FriendsDataSaveLoading());
        final data = await friendsListRepository
            .removeTask(
          event.data,
        )
            .then((value) {
          final friendsList = friendsListRepository.getAllFriends();
          emit(FriendsDataSaveLoaded(friendsList));
        });
      } catch (e) {
        emit(FriendsDataSaveFailure(e.toString()));
      }
    });
    on<SearchFriendEvent>((event, emit) async {
      try {
        await friendsListRepository.init();

        emit(FriendsDataSaveLoading());
       

        final friendsList = friendsListRepository.searchFriends(
            event.firstName);
        if (friendsList.isNotEmpty) {
          emit(FriendsDataSaveLoaded(friendsList));
        } else {
          emit(const FriendsDataSaveFailure("No friend found"));
        }
      } catch (e) {
        emit(FriendsDataSaveFailure(e.toString()));
      }
    });
  }
}
