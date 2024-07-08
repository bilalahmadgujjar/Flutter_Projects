

import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {

  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title:  const Text(
              'Screen 1 ',
              style: TextStyle(
                  color: Colors.white
              ),
            ),

            centerTitle: true,
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Expanded(
                child: ListView.builder(itemCount: 100,itemBuilder: (context,index)
                {
                  return   ListTile(

                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: ()
                    {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>const Screen1()));
                    },
                    trailing: const Icon(Icons.navigate_next),
                  );
                }
                ),
              ),
            ],
          ),
        )
    );
  }
}
