import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_app/screens/home/friends_list.dart';

import '../../business_logic/bloc/bloc/friends_data_save_bloc.dart';
import '../../data/repository/friends_list_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
  int index = 0;

  late FriendsDataSaveBloc friendsDataSaveBloc;


  @override
  void initState() {
    FlutterNativeSplash.remove();

    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (index < 4) {
        index++;
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        index = 4;
        timer.cancel();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final List<Widget> _list = <Widget>[
    Center(
        child: Pages(
      text: "Page One",
      color: Colors.teal,
    )),
    Center(
        child: Pages(
      text: "Page Two",
      color: Colors.red.shade100,
    )),
    Center(
        child: Pages(
      text: "Page Three",
      color: Colors.grey,
    )),
    const FriendsList()
  ];

  @override
  Widget build(BuildContext context) {
    friendsDataSaveBloc = FriendsDataSaveBloc(
        RepositoryProvider.of<FriendsListRepository>(context));
    return Scaffold(
        resizeToAvoidBottomInset: false,
    
        body: BlocProvider(
          create: (context) => friendsDataSaveBloc..add(GetFriendEvent()),
          child: SafeArea(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              allowImplicitScrolling: true,
              scrollDirection: Axis.horizontal,
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              children: _list,
            ),
          ),
        ));
  }

}

class Pages extends StatelessWidget {
  final text;
  final color;
  Pages({this.text, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ]),
      ),
    );
  }
}
