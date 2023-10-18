import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teach_finder_app/bloc/navigation/navigation_bloc.dart';
import 'package:teach_finder_app/ui/welcome/welcome.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => NavigationBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splashTransition: SplashTransition.fadeTransition,
          splash: Center(
<<<<<<< HEAD
            child: Image.asset("assets/icon/icon_color.png"),
=======
            child: Image.asset(
              "assets/icon/icon_color.png",
              height: 200,
            ),
>>>>>>> c4b778422213747429663623a7f963d7628af28b
          ),
          nextScreen: Welcome()),
    );
  }
}
