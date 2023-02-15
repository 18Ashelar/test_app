
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/business_logic/bloc/bloc/friends_data_save_bloc.dart';
import 'package:test_app/data/model/friend_data.dart';
import 'package:test_app/screens/home/friends_details.dart';

import 'components/card_header.dart';
import 'components/custom_text_form_field.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({super.key});

  @override
  State<FriendsList> createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  List<bool>? isSelected;
  Map<String, dynamic> selectedData = {};

  late FriendsDataSaveBloc friendsDataSaveBloc;

  //Controller for input field
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _birthPlace = TextEditingController();

  List<FriendData>? friendDataList;

  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    friendsDataSaveBloc = BlocProvider.of<FriendsDataSaveBloc>(context);

    return Column(
      children: [
        SizedBox(
          height: 60.0,
          width: double.infinity,
          child: Card(
            elevation: 5,
            child: Row(
              children: [
                const SizedBox(
                  width: 20.0,
                ),
                const Expanded(
                  child: Text(
                    "Friends List",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _addFriendsList(context, false, 0);
                  },
                  icon: const Icon(Icons.add),
                  splashRadius: 25,
                  iconSize: 22,
                ),
                IconButton(
                  onPressed: () {
                    var data = selectedData.values
                        .firstWhere((k) => k, orElse: () => false);

                    if (data && selectedData.isNotEmpty) {
                      friendsDataSaveBloc.add(RemoveFriendEvent(selectedData));
                    }
                  },
                  icon: const Icon(Icons.delete),
                  splashRadius: 25,
                  iconSize: 22,
                )
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12.0),
          // height: 40.0,
          child: TextFormField(
            cursorColor: const Color(0xFF000000).withOpacity(0.6),
            controller: _search,
            style: TextStyle(
              fontSize: 16.0,
              color: const Color(0xFF000000).withOpacity(0.8),
            ),
            onChanged: ((value) {
              friendsDataSaveBloc.add(SearchFriendEvent(value));
            }),
            decoration: InputDecoration(
              suffixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_rounded,
                    size: 20.0,
                    color: const Color(0xFF000000).withOpacity(0.6),
                  ),
                ),
              ),

              labelText: "Search Friends",
              isDense: true,

              errorStyle: TextStyle(
                fontFamily: "Roboto",
                color: Theme.of(context).errorColor,
                fontSize: 14.0,
              ),
              floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                  (Set<MaterialState> states) {
                final Color color = states.contains(MaterialState.error)
                    ? Theme.of(context).errorColor
                    : Colors.blue;
                return TextStyle(
                  color: color,
                  fontFamily: "Roboto",
                );
              }),
              // floatingLabelStyle: TextStyle(
              //   fontFamily: "Roboto",
              //   color: const Color(0xFF000000).withOpacity(0.6),
              // ),
              hintText: "Name/Mobile Number",
              hintStyle: TextStyle(
                  fontSize: 16.0,
                  color: const Color(0xFF000000).withOpacity(0.6)),
              suffixStyle: TextStyle(
                fontFamily: "Roboto",
                color: const Color(0xFF000000).withOpacity(0.6),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
              // hintText: label,
              labelStyle: TextStyle(
                  fontSize: 16.0,
                  color: const Color(0xFF000000).withOpacity(0.6)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(0xFF000000).withOpacity(0.38)),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            ),
          ),
        ),
        BlocListener<FriendsDataSaveBloc, FriendsDataSaveState>(
          listener: (context, state) {
            if (state is FriendsDataSaveLoaded) {
              setState(() {
                friendDataList = state.friendData;
                isSelected =
                    List.generate(friendDataList!.length, (index) => false);
                if (friendDataList!.isEmpty) {
                  selectedData.clear();
                } else {
                  selectedData.clear();

                  friendDataList!.forEach((element) {
                    selectedData.addAll({element.id.toString(): false});
                  });
                }
              });
            }
          },
          child: BlocBuilder<FriendsDataSaveBloc, FriendsDataSaveState>(
            builder: (context, state) {
              if (state is FriendsDataSaveLoaded) {
                return Flexible(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12.0, bottom: 12.0),
                    itemCount: friendDataList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            isSelected![index] = !isSelected![index];
                            selectedData[friendDataList![index].id.toString()] =
                                isSelected![index];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Card(
                            elevation: 4,
                            color: isSelected![index] ? Colors.yellow : null,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(children: [
                                CardHeader(
                                  title: "Name:",
                                  data:
                                      "${friendDataList![index].firstName} ${friendDataList![index].lastName}",
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                CardHeader(
                                  title: "Mobile Number:",
                                  data: friendDataList![index].mobileNumber,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                CardHeader(
                                  title: "Dob:",
                                  data: friendDataList![index].dob,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                CardHeader(
                                  title: "Birth Location:",
                                  data: friendDataList![index].birthLocation,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          _addFriendsList(context, true, index);
                                        },
                                        style: TextButton.styleFrom(
                                            foregroundColor: Colors.green),
                                        child: const Text(
                                          "Update Info",
                                          style: TextStyle(fontSize: 16.0),
                                        )),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return FriendsDetails(
                                                friendData:
                                                    friendDataList![index],
                                              );
                                            },
                                          ));
                                        },
                                        child: const Text(
                                          "More Info",
                                          style: TextStyle(fontSize: 16.0),
                                        )),
                                  ],
                                )
                              ]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              if (state is FriendsDataSaveFailure) {
                return Flexible(
                  child: Center(
                      child: Text(
                    state.message,
                    style: const TextStyle(fontSize: 16.0),
                  )),
                );
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }

  //For user to enter manual barcode details
  Future<void> _addFriendsList(BuildContext context, bool isUpdate, int index) {
    if (isUpdate) {
      _firstName.text = friendDataList![index].firstName;
      _lastName.text = friendDataList![index].lastName;
      _mobileNumber.text = friendDataList![index].mobileNumber;
      _dob.text = friendDataList![index].dob;
      _birthPlace.text = friendDataList![index].birthLocation;
    } else {
      _firstName.clear();
      _lastName.clear();
      _mobileNumber.clear();
      _dob.clear();
      _birthPlace.clear();
    }
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setterState) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Add Friend",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                            ),
                            // style: Theme.of(context).textTheme.subtitle1,
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 30,
                              color: Colors.black.withOpacity(0.8),
                              //  color: Color(0xFF5F6368),
                            ),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pop(context);
                            },
                          ),
                        ]),
                    Divider(
                      thickness: 1.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 15.0),
                        child: ListView(children: [
                          // SizedBox(
                          //   height: 3.h,
                          // ),
                          CustomTextFormField(
                            labelName: "First Name",
                            controller: _firstName,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                            labelName: "Last Name",
                            controller: _lastName,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                            labelName: "Mobile Number",
                            controller: _mobileNumber,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10)
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                            labelName: "Date Of Birth",
                            controller: _dob,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                            labelName: "Birth City",
                            controller: _birthPlace,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Birth Location on Map',
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (isUpdate) {
                                      FriendData friendData = FriendData(
                                          id: UniqueKey().hashCode,
                                          firstName: _firstName.text,
                                          lastName: _lastName.text,
                                          mobileNumber: _mobileNumber.text,
                                          dob: _dob.text,
                                          birthLocation: _birthPlace.text);
                                      friendsDataSaveBloc.add(UpdateFriendEvent(
                                          friendData,
                                          friendDataList![index].id));
                                    } else {
                                      FriendData friendData = FriendData(
                                          id: UniqueKey().hashCode,
                                          firstName: _firstName.text,
                                          lastName: _lastName.text,
                                          mobileNumber: _mobileNumber.text,
                                          dob: _dob.text,
                                          birthLocation: _birthPlace.text);
                                      friendsDataSaveBloc
                                          .add(AddFriendEvent(friendData));
                                    }

                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    (isUpdate) ? "Update Friend" : "Add Friend",
                                    style: const TextStyle(fontSize: 16.0),
                                  )))
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() => friendsDataSaveBloc.add(GetFriendEvent()));
  }
}

