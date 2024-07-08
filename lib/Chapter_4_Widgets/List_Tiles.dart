import 'package:flutter/material.dart';

class List_Tiles extends StatelessWidget {
  const List_Tiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('List Tiles'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ListTile(
            //   title: Text('Bilal Ahmad TECH'),
            //   subtitle: Text('Subscribe to my channel'),
            //   trailing: Text('3:51 PM'),
            //   leading: CircleAvatar(
            //     backgroundColor: Colors.grey,
            //     //    child: Icon(Icons.person,size: 50,),
            //     backgroundImage: NetworkImage(
            //         'https://images.pexels.com/photos/19581191/pexels-photo-19581191/free-photo-of-portrait-of-chimango-caracara-bird.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            //   ),
            // ),


            Expanded(

              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context,index)
              {
                return   const
                ListTile(
                  title: Text('Bilal Ahmad TECH'),
                  subtitle: Text('Subscribe to my channel'),
                  trailing: Text('3:51 PM'),
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    //    child: Icon(Icons.person,size: 50,),
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/19581191/pexels-photo-19581191/free-photo-of-portrait-of-chimango-caracara-bird.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                );
              }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
