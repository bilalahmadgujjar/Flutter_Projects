import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isEmailValid = false;
  String errorEmailMessage = '';

  validateEmail() {
    if (emailController.text.isEmpty) {
      setState(() {
        errorEmailMessage = 'Email is required';
        isEmailValid = false;
      });
    } else if (!emailController.text.contains('@')) {
      setState(() {
        errorEmailMessage = 'Email is inValid';
        isEmailValid = false;
      });
    } else if (emailController.text.contains(' ')) {
      setState(() {
        errorEmailMessage = 'Email is inValid';
        isEmailValid = false;
      });
    } else {
      setState(() {
        errorEmailMessage = '';
        isEmailValid = true;
      });
    }
  }

  bool isPassValid = false;
  String errorPassMessage = '';

  validatePass() {
    if (passController.text.isEmpty) {
      setState(() {
        errorPassMessage = 'Pass is required';
        isPassValid = false;
      });
    } else if (passController.text.length < 6) {
      setState(() {
        errorPassMessage = 'Password length must be 6';
        isPassValid = false;
      });
    } else if (passController.text.contains(' ')) {
      setState(() {
        errorPassMessage = 'Pass is inValid';
        isPassValid = false;
      });
    } else {
      setState(() {
        errorPassMessage = '';
        isPassValid = true;
      });
    }
  }


  void onLogin()
  {
    if(isEmailValid && isPassValid)
      {
        print('Login Sucess');
      }
    else
      {
        print('Issue Arrived');
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenHeight(context) * 4),
        child: ListView(
          children: [
            TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  labelText: 'Email',
                  hintStyle: const TextStyle(fontSize: 13),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (value) {
                  validateEmail();
                }),
            if (errorEmailMessage.isNotEmpty)
              Column(
                children: [
                  Text(
                    errorEmailMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            SizedBox(
              height: screenHeight(context) * 2,
            ),
            TextFormField(
                controller: passController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  labelText: 'Pass',
                  hintStyle: const TextStyle(fontSize: 13),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (value) {
                  validatePass();
                }),
            if (errorPassMessage.isNotEmpty)
              Column(
                children: [
                  Text(
                    errorPassMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            SizedBox(height: screenHeight(context)*3,),
            ElevatedButton(
              onPressed: onLogin,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
