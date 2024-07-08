import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';

class Chat_UI extends StatelessWidget {
  const Chat_UI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            //    child: Icon(Icons.person,size: 50,),
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/19581191/pexels-photo-19581191/free-photo-of-portrait-of-chimango-caracara-bird.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          ),
          SizedBox(
            width: screenWidth(context) * 2,
          ),
          Text(
            'Noman Uog 95',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenHeight(context) * 2.7,
            ),
          ),
          SizedBox(
            width: screenWidth(context) * 9,
          ),
          const Icon(
            Icons.video_call_rounded,
            color: Colors.white,
          ),
          SizedBox(
            width: screenWidth(context) * 3,
          ),
          const Icon(
            Icons.call,
            color: Colors.white,
          ),
          SizedBox(
            width: screenWidth(context) * 3,
          ),
          const Icon(
            Icons.more_vert_outlined,
            color: Colors.white,
          ),
        ],
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the back arrow color to white
        ),
      ),
      body: SafeArea(
        child:    Stack(
          children: [
            //send and receive messAGE UI here
            // Expanded(
            //   child: ListView(
            //     padding: EdgeInsets.all(8.0),
            //     children: [
            //       ChatBubble(
            //         message: "Hello!",
            //         isSentByMe: true,
            //       ),
            //       ChatBubble(
            //         message: "Hi there!",
            //         isSentByMe: false,
            //       ),
            //       // Add more ChatBubble widgets to simulate conversation
            //     ],
            //   ),
            // ),

            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return  (index%2==0) ? const ChatBubble(
                    message: "Hello!",
                    isSentByMe: true,
                  ) :
                  const ChatBubble(
                    message: "Hey!",
                    isSentByMe: false,
                  );



                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorColor: Colors.teal,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: 'Message',
                          hintStyle: const TextStyle(color: Colors.grey),
                          suffixIcon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.grey,
                          ),
                          prefixIcon: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: screenHeight(context)*8,
                      width: screenWidth(context)*12,
                      decoration: const BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.mic,color: Colors.white,),
                    ),
                  ),
              
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  const ChatBubble({super.key, 
    required this.message,
    required this.isSentByMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.teal : Colors.grey[300],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child:

        Column(
          children: [
            if(  isSentByMe== false)
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey,
                  //    child: Icon(Icons.person,size: 50,),
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/19581191/pexels-photo-19581191/free-photo-of-portrait-of-chimango-caracara-bird.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                ),

            Text(
              message,
              style: TextStyle(
                color: isSentByMe ? Colors.white : Colors.black87,
              ),
            ),
            Text('9:00 PM',style: TextStyle(fontSize: screenHeight(context)*1),),
          ],
        )


      ),
    );
  }
}