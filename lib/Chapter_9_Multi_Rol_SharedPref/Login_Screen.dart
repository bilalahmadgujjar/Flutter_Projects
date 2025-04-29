import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Multi_Role_Base.dart';
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Signup_Screen.dart';
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Student.dart';
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Teacher.dart';
import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? savedEmail;
  String? savedPassword;
  String? savedRole;

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  Future<void> loadSavedData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      savedEmail = sp.getString('email');
      savedPassword = sp.getString('pass');
      savedRole = sp.getString('userType');
    });

    print("Saved Email: $savedEmail");
    print("Saved Password: $savedPassword");
    print("Saved Role: $savedRole");

  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
  login() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      final enteredEmail = emailController.text.trim();
      final enteredPassword = passwordController.text.trim();

      final savedEmail = sp.getString('email');
      final savedPassword = sp.getString('pass');
      final savedRole = sp.getString('userType');

      print("Saved Email: $savedEmail");
      print("Saved Password: $savedPassword");
      print("Saved Role: $savedRole");

      if (enteredEmail != savedEmail || enteredPassword != savedPassword) {
        showError("Invalid email or password");
        return;
      }

      if (savedRole == 'Student') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Student()));
      } else if (savedRole == 'Teacher') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Teacher()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Multi_Role_Base()));
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Login'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Image(
                height: screenHeight(context) * 20,
                width: screenWidth(context) * 20,
                image: NetworkImage('https://cdn.pixabay.com/photo/2020/08/05/13/28/eco-5465482_640.png') ),
            Form(
              key: _formKey,
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Enter email';
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) return 'Invalid email';
                    return null;
                  },
                ),
                SizedBox(height: screenHeight(context) * 3),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Enter password';
                    if (value.length < 6) return 'Minimum 6 characters';
                    return null;
                  },
                ),
                SizedBox(height: screenHeight(context) * 5),
                InkWell(
                  onTap:()
                    async{
                      await login();
                    },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: screenHeight(context) * 5,
                      width: double.infinity,
                      color: Colors.deepOrange,
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("If don't have already account"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup_Screen()));
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            color: Colors.deepOrange,
                          ),
                        )),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
