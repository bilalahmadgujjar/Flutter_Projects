import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Login_Screen.dart';
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Multi_Role_Base.dart';
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Student.dart';
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Teacher.dart';
import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('SignUP'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(

            children: [
              Image(
                  height: screenHeight(context) * 20,
                  width: screenWidth(context) * 20,
                  image: NetworkImage('https://cdn.pixabay.com/photo/2020/08/05/13/28/eco-5465482_640.png') ),
              Form(
                key: _formKey, // Attach the form key
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight(context) * 3),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight(context) * 3),
                    TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Age'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter age';
                        }
                        final age = int.tryParse(value);
                        if (age == null || age < 10 || age > 100) {
                          return 'Please enter a valid age (10-100)';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight(context) * 3),
                    DropdownButtonFormField<String>(
                      value: selectedRole,
                      hint: const Text('Select Role'),
                      items: ['Teacher', 'Student'].map((String role) {
                        return DropdownMenuItem<String>(
                          value: role,
                          child: Text(role),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedRole = newValue;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select a role' : null,
                    ),
                    SizedBox(height: screenHeight(context) * 5),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          SharedPreferences sp =
                              await SharedPreferences.getInstance();
                          sp.setString('email', emailController.text.trim());
                          sp.setString('age', ageController.text.trim());
                          sp.setString('pass', passwordController.text.trim());
                          sp.setBool('isLogin', true);
                          sp.setString('userType', selectedRole!);

                          if (selectedRole == 'Student') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Student()));
                          } else if (selectedRole == 'Teacher') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Teacher()));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Multi_Role_Base()));
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: screenHeight(context) * 5,
                          width: double.infinity,
                          color: Colors.deepOrange,
                          child: const Center(
                            child: Text(
                              'Signup',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('If you have already account'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page()));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.deepOrange,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: screenHeight(context) * 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
