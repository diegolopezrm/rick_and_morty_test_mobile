import 'package:alfred_test/config/my_colors.dart';
import 'package:alfred_test/pages/characters_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: MyColor.myBlue,
            onSurface: MyColor.myGreen,
            onPrimary: MyColor.myGreen,
            textStyle: const TextStyle(fontSize: 20),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: CharacterPage(),
    );
  }
}
