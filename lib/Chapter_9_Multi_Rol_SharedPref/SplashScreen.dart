
import 'dart:async';

import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Login_Screen.dart';
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Student.dart';
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Teacher.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if (isLogin) {
      if (userType == 'Student') {
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Student()));
        });
      }

      else if (userType == 'Teacher') {
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Teacher()));
        });
      }

      else{
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login_Screen()));
        });
      }


    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login_Screen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Image(
            fit: BoxFit.fitHeight,
            image: NetworkImage(
              'https://images.pexels.com/photos/25347408/pexels-photo-25347408/free-photo-of-a-street-with-a-lamp-post-and-a-building.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
            ),
          ),
        ),
      ),
    );
  }
}
