
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Login_Screen.dart';
import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {

  String email='';

  String age='';
  String student= '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  void load()
  async {
    SharedPreferences sp =await SharedPreferences.getInstance();
    email= sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    student = sp.getString('userType') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Student Screen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Email'),
                  Text(email),
                ],
              ),
              SizedBox(height: screenHeight(context)*2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Age'),
                  Text(age),
                ],
              ),
              SizedBox(height: screenHeight(context)*2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('USER TYPES'),
                  Text(student),
                ],
              ),

              SizedBox(
                height: screenHeight(context) * 5,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();

                  sp.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login_Screen()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: screenHeight(context) * 5,
                    width: double.infinity,
                    color: Colors.deepOrange,
                    child: const Center(
                      child: Text('LoginOut'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
