///   Chapter content
//   Appbar
//   Drawer
//  Navigation
// Side Menu
//  Code refacoring
// Routing and navigation or moving
// Build small navigation drawer app


import 'package:first_project/Chapter_5/screen_1.dart';
import 'package:flutter/material.dart';

class Chapter_5 extends StatelessWidget {


  const Chapter_5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
       home: Scaffold(
         backgroundColor: Colors.white,
         appBar: AppBar(
           backgroundColor: const Color(0xFF764abc),
           title:  const Text(
        'Navigation Drawer',
             style: TextStyle(
               color: Colors.white
             ),
         ),
           centerTitle: true,
         ),
         drawer: Drawer(
           width: 200.0,
           child:ListView(
             padding: EdgeInsets.zero,
             children:[

                 // DrawerHeader(
                 //   curve: Cubic(0.8, 0.2, 1.2, 1.0),
                 //   child: Text('Hello'),
                 //
                 // ),
                 const UserAccountsDrawerHeader(accountName: Text('Bilal Ahmad'), accountEmail: Text('bilalgujjar@gmail.com')),
              ListTile(

                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: ()
                {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const Screen1()));
                },
                trailing: const Icon(Icons.navigate_next),
              ),
               ListTile(

                 leading: const Icon(Icons.home),
                 title: const Text('Home'),
                 onTap: ()
                 {
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>const Screen1()));
                 },
                 trailing: const Icon(Icons.navigate_next),
               ),
               ],

           ),

         ),
         body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
        Center(child: TextButton(onPressed: (){
         // Navigator.pushReplacement();
          Navigator.push(context,MaterialPageRoute(builder: (context)=>const Screen1()));

        }, child: const Text('Screen 1'))),
           ],
         ),
       )
    );
  }
}
