
import 'package:first_project/Chapter_6_Whatsapp_UI/Chat_UI.dart';
import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';


class Whatsapp_UI extends StatelessWidget {
 const Whatsapp_UI({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          //centerTitle: true,
          title: Text(
            'WhatsApp',
            style: TextStyle(
                color: Colors.white, fontSize: screenHeight(context) * 2.7),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[300],
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3,
              ),
              insets: EdgeInsets.symmetric(horizontal: 60.0),
            ),
            tabs: const [
              Tab(child: Icon(Icons.camera_alt_outlined)),
              Tab(child: Text('Chats')),
              Tab(child: Text('Status')),
              Tab(child: Text('Calls')),
            ],
          ),
          actions: [
            const Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(
              width: screenWidth(context) * 3,
            ),
            //Icon(Icons.more_vert_outlined,color: Colors.white,),
            PopupMenuButton(
                elevation: 1,
                icon: const Icon(
                  Icons.more_vert_outlined,
                  color: Colors.white,
                ),
                itemBuilder: (context) => [
                      const PopupMenuItem(child: Text('New Group')),
                      const PopupMenuItem(child: Text('Settings')),
                      const PopupMenuItem(child: Text('Logout')),
                    ])
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 2),
          child: TabBarView(
            children: [
              const Text('1'),
              // Camera Tab

              ///TODO Chats
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return  ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Chat_UI()));
                            },
                            title: const Text('Bilal Ahmad TECH'),
                            subtitle: const Text(
                              'New Message',
                              style: TextStyle(color: Colors.grey),
                            ),
                            trailing: const Text('3:51 PM'),
                            leading: const CircleAvatar(
                              backgroundColor: Colors.grey,
                              //    child: Icon(Icons.person,size: 50,),
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/19581191/pexels-photo-19581191/free-photo-of-portrait-of-chimango-caracara-bird.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                            ),
                          );
                        }),
                  ),
                ],
              ),

              ///TODO STATUS
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               Expanded(child: Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: Text('Status',textAlign: TextAlign.left,style: TextStyle(fontSize: screenHeight(context)*3,  ),),
               )  ),
                  Expanded( flex: 2,
                    child: ListTile(
                      title: const Text('MY status'),
                      subtitle: const Text(
                        '9:00 AM',
                        style: TextStyle(color: Colors.grey,),
                      ),

                      leading: Container(
                        padding: const EdgeInsets.all(2),
                        width:screenWidth(context)*14,
                        height: screenHeight(context)*20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:Border.all(
                              color: Colors.teal,
                              width: 2,
                            )
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.grey,
                          //    child: Icon(Icons.person,size: 50,),
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/19581191/pexels-photo-19581191/free-photo-of-portrait-of-chimango-caracara-bird.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Recent updates',textAlign: TextAlign.left,style: TextStyle(fontSize: screenHeight(context)*2,  ),),
                  )  ),
                  Expanded(
                    flex: 12,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return ListTile(

                            title: const Text('Bilal Ahmad'),
                            subtitle: const Text(
                              '6 minutes ago',
                              style: TextStyle(color: Colors.grey,),
                            ),

                            leading: Container(
                              padding: const EdgeInsets.all(2),
                              width:screenWidth(context)*14,
                              height: screenHeight(context)*10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:Border.all(
                                  color: Colors.teal,
                                  width: 2,
                                )
                              ),
                              child: const CircleAvatar(
                                backgroundColor: Colors.grey,
                                //    child: Icon(Icons.person,size: 50,),
                                backgroundImage: NetworkImage(
                                    'https://images.pexels.com/photos/19581191/pexels-photo-19581191/free-photo-of-portrait-of-chimango-caracara-bird.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),

              ///TODO CALLS
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return  ListTile(
                            title: const Text('Bilal Ahmad TECH'),
                            subtitle:  Text(index % 2 == 0 ? 'you missed call' :'you missed video call' ,style: const TextStyle(color: Colors.grey),),
                            trailing: Icon(index % 2 == 0 ? Icons.phone : Icons.video_call, color: Colors.red),
                            leading: const CircleAvatar(
                              backgroundColor: Colors.grey,
                              //    child: Icon(Icons.person,size: 50,),
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/19581191/pexels-photo-19581191/free-photo-of-portrait-of-chimango-caracara-bird.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
