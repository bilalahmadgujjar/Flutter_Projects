import 'dart:convert';

import 'package:first_project/Chapter_10_API/API_2/Api2_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api2 extends StatefulWidget {
  const Api2({super.key});

  @override
  State<Api2> createState() => _Api2State();
}

class _Api2State extends State<Api2> {

  List<Photos> photoslist = [];

  Future<List<Photos>> getPhotos()async
  {
    final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
     var data = jsonDecode(response.body.toString());
    if(response.statusCode==200)
      {
        for(var i in data)
          {
            Photos photos = (Photos(title: i['title'], url: i['url'],id: i['id']));
            photoslist.add(photos);

          }
        return photoslist;
      }

    else
      {
        //return photoslist;
        throw Exception('Failed to load posts');
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: FutureBuilder<List<Photos>>(
        future: getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  const Center(child: Text('Loading'));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            var photoList = snapshot.data!;
            return ListView.builder(
              itemCount: photoList.length,
              itemBuilder: (context, index) {

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(photoList[index].url.toString())),
                  // leading: CircleAvatar(
                  //   backgroundImage: NetworkImage(photoList[index].url ?? ''),
                  //   onBackgroundImageError: (_, __) {
                  //     print('Failed to load image at ${photoList[index].url}');
                  //   },
                  // ),

                  title: Text('Notes id  ${photoList[index].id}'),
                  subtitle: Text(photoList[index].title.toString()),

                );
              },
            );
          } else {
            return  const Center(child: Text('No data found'));
          }
        },
      ),
    ),);
  }
}
