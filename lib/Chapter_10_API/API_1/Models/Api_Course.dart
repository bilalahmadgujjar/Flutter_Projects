// import 'dart:convert';
//
// import 'package:first_project/Chapter_10/Models/Api_Model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class Api_Coures extends StatefulWidget {
//   const Api_Coures({super.key});
//
//   @override
//   State<Api_Coures> createState() => _Api_CouresState();
// }
//
// class _Api_CouresState extends State<Api_Coures> {
//   List<ApiModel> postList = [];
//
//   Future<List<ApiModel>> getPostApi() async {
//
//     final respone = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//
//     var data = jsonDecode(respone.body.toString());
//
//     if (respone.statusCode == 200) {
//       for (Map i in data) {
//         postList.add(ApiModel.fromJson(i));
//       }
//       return postList;
//     }
//
//     else {
//       return postList;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('API '),
//       centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: FutureBuilder(future: getPostApi(), builder: (context,snapshot){
//                     if(snapshot.hasData)
//                       {
//                           return Text('Loading data');
//                       }
//                     else
//                         {
//
//                               return Expanded(
//                                 child: ListView.builder( itemCount: postList.length, itemBuilder: (context,index)
//                                 {
//                                      return Text(postList[index].title.toString());
//                                 }
//                                 ),
//                               );
//                         }
//               }),
//             ),
//
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'dart:convert';

import 'package:first_project/Chapter_10_API/API_1/Models/Api_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCourses extends StatefulWidget {
  const ApiCourses({super.key});

  @override
  State<ApiCourses> createState() => _ApiCoursesState();
}

class _ApiCoursesState extends State<ApiCourses> {
  
  
  Future<List<ApiModel>> getPostApi() async {
    List<ApiModel> postList = [];
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      postList.clear();
      for (var item in data) {
        postList.add(ApiModel.fromJson(item));
      }
      return postList;
    }

    else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: const Text('API'),
        centerTitle: true,
      ),
      body: SafeArea(

        child: FutureBuilder<List<ApiModel>>(
          future: getPostApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  const Center(child: Text('Loading'));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              var postList = snapshot.data!;
              return ListView.builder(
                itemCount: postList.length,
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
                                text: 'ID : ${postList[index].id}',
                                style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                children:  <TextSpan>[

                                  const TextSpan(
                                    text: '\nTitle : ',
                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: postList[index].title.toString(),
                                    style: const TextStyle(fontWeight: FontWeight.w400,color: Colors.black),
                                  ),

                                  const TextSpan(
                                    text: '\nBody : ',
                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                  ),

                                  TextSpan(
                                    text: postList[index].body.toString(),
                                    style: const TextStyle(fontWeight: FontWeight.w400,color: Colors.black),
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
