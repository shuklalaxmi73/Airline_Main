import 'package:aeroplane/screens/bottom_bar.dart';
import 'package:aeroplane/screens/flight_animation.dart';
import 'package:aeroplane/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        primaryColor: primary,
        //colorScheme: ColorScheme.fromSeed(seedColor:  Colors.blue),
        //useMaterial3: true,
      ),
      home:FlightAnimationHomePage(),
    );
  }
}


