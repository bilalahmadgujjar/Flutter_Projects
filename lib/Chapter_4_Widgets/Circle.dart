import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey,
    //    child: Icon(Icons.person,size: 50,),
                  backgroundImage: NetworkImage('https://images.pexels.com/photos/19581191/pexels-photo-19581191/free-photo-of-portrait-of-chimango-caracara-bird.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),



                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
