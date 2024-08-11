import 'dart:convert';

import 'package:first_project/Chapter_10_API/Api_3_Complex/Api3_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Api_3 extends StatefulWidget {
  const Api_3({super.key});

  @override
  State<Api_3> createState() => _Api_3State();
}

class _Api_3State extends State<Api_3> {

  List<Api3Model> userlist = [];

  Future<List<Api3Model>> getUserApi() async
  {
    final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200)
      {
        for(var i in data)
          {
            userlist.add(Api3Model.fromJson(i));

          }
        return userlist;
      }



    else
      {
        throw Exception('Failed to load User data');
       // return userlist;
      }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('COMPLEX API 3 '),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Api3Model>>(
          future: getUserApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  const Center(child: Text('Loading'));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              var userList = snapshot.data!;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment:  MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            RichText(
                              text: TextSpan(
                                text: 'ID : ${userList[index].id}',
                                style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                children:  <TextSpan>[

                                  const TextSpan(
                                    text: '\nName : ',
                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: userList[index].name.toString(),
                                    style: const TextStyle(fontWeight: FontWeight.w400,color: Colors.black),
                                  ),

                                  const TextSpan(
                                    text: '\nEmail : ',
                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                  ),

                                  TextSpan(
                                    text: userList[index].email.toString(),
                                    style: const TextStyle(fontWeight: FontWeight.w400,color: Colors.black),
                                  ),

                                  TextSpan(
                                    text: '\nAddress : ${userList[index].address!.city}',
                                    style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                  ),

                                  TextSpan(
                                    text: '\nLat : ${userList[index].address!.geo!.lat}',
                                    style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                  ),





                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return  const Center(child: Text('No data found'));
            }
          },
        ),
      ),

    );
  }
}


