
import 'dart:async';

import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Login_Screen.dart';
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Signup_Screen.dart';
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
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login_Page()));
        });
      }


    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login_Page()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Image(
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            image: NetworkImage(
              'https://i.pinimg.com/736x/f6/97/33/f69733fa23853a67d43ecbcdc0eb2fe4.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
