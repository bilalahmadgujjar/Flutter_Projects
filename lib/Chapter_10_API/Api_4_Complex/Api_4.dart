import 'dart:convert';
import 'package:first_project/Chapter_10_API/Api_4_Complex/Api4_Model.dart';
import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Api4 extends StatefulWidget {
  const Api4({super.key});

  @override
  State<Api4> createState() => _Api4State();
}

class _Api4State extends State<Api4> {


  Future<Api4Model> getProductApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/07e86e7a-1733-4b07-820b-6c586c494328'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      try{
        return Api4Model.fromJson(data);
      } catch(e)
    {
      throw Exception('Failed to parse JSON: $e');
    }

    } else {
      //throw Exception('Failed to load product data');
      //return Api4Model.fromJson(data);
      throw Exception('Failed to load product data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('COMPLEX API'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder<Api4Model>(
              future: getProductApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Text('Loading...'),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data?.data == null) {
                  return const Center(child: Text('No data available'));
                }

                else {
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           ListTile(
                             title: Text(snapshot.data!.data![index].shop!.name.toString()),
                             subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                             leading: CircleAvatar(
                               backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                             ),
                           ),
                            SizedBox(
                              height: screenHeight(context) * 50,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.data![index].images!.length,
                                  itemBuilder: (context, position) {
                                    return Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Container(
                                        width: screenWidth(context) * 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapshot.data!.data![index].images![position].url.toString()),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Text(snapshot.data!.data![index].price.toString()),
                            Icon(snapshot.data!.data![index].inWishlist == true ? Icons.favorite :Icons.favorite_outline),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
