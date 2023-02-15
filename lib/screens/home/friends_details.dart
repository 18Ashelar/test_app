
import 'package:flutter/material.dart';
import 'package:test_app/data/model/friend_data.dart';

import '../../business_logic/bloc/bloc/friends_data_save_bloc.dart';
import 'components/card_header.dart';

class FriendsDetails extends StatefulWidget {
  const FriendsDetails({super.key,required this.friendData});

  final FriendData friendData;

  @override
  State<FriendsDetails> createState() => _FriendsDetailsState();
}

class _FriendsDetailsState extends State<FriendsDetails> {



    late FriendsDataSaveBloc friendsDataSaveBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text("Friend Details"),
      ),
 
      body: SafeArea(
        child: Container(
          height: 320,
          padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
          child: Card(
            elevation: 4,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Column(children: [
                 CardHeader(
                  title: "First Name:",
                  data: widget.friendData.firstName,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 CardHeader(
                  title: "Last Name:",
                  data: widget.friendData.lastName,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CardHeader(
                  title: "Mobile Number:",
                  data: widget.friendData.mobileNumber,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CardHeader(
                  title: "Dob:",
                  data:widget.friendData.dob,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 CardHeader(
                  title: "Birth Location:",
                  data: widget.friendData.birthLocation,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Birth location on map',
                      style: TextStyle(
                          fontSize: 14,
                       ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
