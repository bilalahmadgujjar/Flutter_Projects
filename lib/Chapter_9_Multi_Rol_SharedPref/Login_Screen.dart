
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Multi_Role_Base.dart';
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Student.dart';
import 'package:first_project/Chapter_9_Multi_Rol_SharedPref/Teacher.dart';
import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  String? selectedRole; // Add a variable to store the selected role

  // Future<void> sp() async {
  //   //in which we intialize the sharedpreference
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   sp.setString('name', 'Bilal');
  //   sp.setInt('age', 20);
  //   sp.setBool('isLogin', false);
  //   print(sp.get('name'));
  //   print(sp.get('age'));
  //   print(sp.get('isLogin'));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUP'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: screenHeight(context) * 3,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(
                height: screenHeight(context) * 3,
              ),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
              ),
              SizedBox(
                height: screenHeight(context) * 3,
              ),
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
              ),

              SizedBox(
                height: screenHeight(context) * 5,
              ),
              InkWell(
                onTap: () async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('age', ageController.text.toString());
                  sp.setBool('isLogin', true);
                  sp.setString('userType', selectedRole.toString());

                 String type = '';
                 type = sp.getString('userType') ??  '';
                  if(type == 'Student' )
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Student()));

                    }

                  else if(type == 'Teacher' )
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Teacher()));
                    }

                  else
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Multi_Role_Base()));
                    }


                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: screenHeight(context) * 5,
                    width: double.infinity,
                    color: Colors.deepOrange,
                    child: const Center(
                      child: Text('Signup'),
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
