import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/data/repository/friends_list_repository.dart';
import 'package:test_app/screens/home/home_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FriendsListRepository(),
      child: MaterialApp(
        title: 'Friends App',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
        home: const HomeScreen(),
      ),
    );
  }
}
