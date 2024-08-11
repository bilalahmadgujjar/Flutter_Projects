
import 'package:first_project/Chapter_10_API/Api_4_Complex/Api_4.dart';
import 'package:first_project/form_validation/form_validation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Login(),
      //home:LotteryApp(),
      //home: Container_W(),
      //home:Row_W(),
      //home: Stack_W(),
      //home: Circle(),
      //home: Size_Box(),
      //home: Text_Field(),
      //home:List_Tiles(),
      //home: Chapter_5(),
      //home: Whatsapp_UI(),
     // home: Pub_Dev(),
      //home: Calculator(),
      //home: Splash_Screen(),
      //home: ApiCourses(),
     // home: Api2(),
      //  home: Api_3(),
      //home: Api4(),
      home: FormValidation(),
    );
  }
}

