import 'package:flutter/material.dart';
import 'package:netflix_app/domain/core/colors/colors.dart';
import 'package:netflix_app/presentation/main_page/screen_main_page.dart';

main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        backgroundColor: Colors.black,
        primarySwatch:Colors.red,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        )
      ),
      home: ScreenMainPage(),
    );
  }
}