import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/data/model/friend_data.dart';

class FriendsListRepository {
  late Box<FriendData> _tasks;

  Future<void> init() async {
      if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(FriendDataAdapter());
    }
    _tasks = await Hive.openBox<FriendData>('friend');

  
  }

  List<FriendData> getAllFriends() {
    final tasks = _tasks.values;
    return tasks.toList();
  }

  List<FriendData> searchFriends(String searchString) {
    final tasks = _tasks.values.where((element) =>
        element.firstName.toLowerCase().startsWith(searchString.toLowerCase()) || element.mobileNumber.startsWith(searchString));
    return tasks.toList();
  }

  void addFriends(FriendData friendData) {
    _tasks.add(friendData);
  }

  Future<void> removeTask(Map<String,dynamic> data) async {
   
    data.forEach((key, value) async{
      if(value)
      {
 final taskToRemove =
        _tasks.values.firstWhere((element) => element.id == int.parse(key));
    await taskToRemove.delete();
      }
     });
  }

  Future<void> updateTask(final int id, FriendData friendData) async {
    final taskToEdit = _tasks.values.firstWhere((element) => element.id == id);
    final index = taskToEdit.key as int;
    await _tasks.put(index, friendData);
  }
}
