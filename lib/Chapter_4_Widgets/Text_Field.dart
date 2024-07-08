import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';

class Text_Field extends StatelessWidget {
  const Text_Field({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Fields'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: screenHeight(context)*5,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  hintText: 'Email',
                  labelText: 'Email',
                  hintStyle: const TextStyle(fontSize: 13),
errorBorder: OutlineInputBorder(
borderSide: const BorderSide(color: Colors.red),
  borderRadius: BorderRadius.circular(30),
)
                ),


                onChanged: (value)
                {
                  print(value);
                },

              ),
          ],
        ),
      ),
    );
  }
}
