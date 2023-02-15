// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'friend_data.g.dart';

@HiveType(typeId: 1)
class FriendData extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String mobileNumber;
  @HiveField(4)
  final String dob;
  @HiveField(5)
  final String birthLocation;
  FriendData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.dob,
    required this.birthLocation,
  });

  @override
  String toString() {
    return 'FriendData(id: $id, firstName: $firstName, lastName: $lastName, mobileNumber: $mobileNumber, dob: $dob, birthLocation: $birthLocation)';
  }
}
