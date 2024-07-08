import 'package:flutter/material.dart';

class Stack_W extends StatelessWidget {
  const Stack_W({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [




               SizedBox(
                 child: Stack(
               alignment: Alignment.center,
                   children: [

                     Container(
                       height: 200,
                       width: 200,
                       color: Colors.red,
                     ),


                     Container(
                       height: 100,
                       width: 100,
                       color: Colors.white,
                     ),


                     const Positioned( right: 100, child: Text('BILAL AHMAD ')),
                   ],
                 ),
               )


             ],
          ),
        ),
      ),
    );
  }
}
