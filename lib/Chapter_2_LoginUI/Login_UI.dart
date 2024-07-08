import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight(context) * 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        height: screenHeight(context) * 20,
                        width: screenWidth(context) * 20,
                        image: const AssetImage('images/logo.png')),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Photography',
                          style: TextStyle(
                              fontSize: screenHeight(context) * 3,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'CS',
                          style: TextStyle(
                              fontSize: screenHeight(context) * 3,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFf9703b)),
                        ),
                      ],
                    )
                  ],
                ),

                Center(
                    child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: screenHeight(context) * 3,
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: screenHeight(context) * 1,
                ),
                Center(
                    child: Text(
                  'Lorem ipsum donor sit amet.\nConsectetur ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: screenHeight(context) * 2,
                      fontWeight: FontWeight.w400),
                )),

                SizedBox(
                  height: screenHeight(context) * 7,
                ),

                ///TODO TEXT FIELD
                TextFormField(
                  cursorColor: Colors.black45,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: const Color(0xFF323f4e),
                        fontSize: screenHeight(context) * 2.5),
                    // hintText: 'Email',

                    prefixIcon: const Icon(
                      Icons.alternate_email,
                      color: Color(0xFF323f4e),
                    ),
                    fillColor: const Color(0xFFF8F9FA),
                    filled: true,
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFe4e7eb)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0XFFe4e7eb)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight(context) * 2,
                ),
                TextFormField(
                  cursorColor: Colors.black45,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: const Color(0xFF323f4e),
                        fontSize: screenHeight(context) * 2.5),
                    // hintText: 'Email',

                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFF323f4e),
                    ),
                    fillColor: const Color(0xFFF8F9FA),
                    filled: true,
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFe4e7eb)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0XFFe4e7eb)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight(context) * 1,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          textAlign: TextAlign.right,
                          'Forgot Password',
                          style: TextStyle(color: Colors.black,
                              fontSize: screenHeight(context) * 2,
                            fontWeight: FontWeight.w400,

                          ),
                        )),
                  ],
                ),

                SizedBox(
                  height: screenHeight(context) * 10,
                ),
                Container(
                  height: screenHeight(context) * 6,
                  width: screenWidth(context) * 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFf9703b),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight(context) * 1,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      "Don't have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: screenHeight(context) * 2,
                          fontWeight: FontWeight.w400),
                    )),
                    Center(
                        child: Text(
                      " Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xFFf9703b),
                          fontSize: screenHeight(context) * 2,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
