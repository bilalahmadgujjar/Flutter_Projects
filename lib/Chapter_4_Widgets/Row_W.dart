import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';



class Row_W extends StatelessWidget {
  const Row_W({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          title: const Text(
            'Top Ten Widgets ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(

                      child: Center(
                        child: Container(
                            height: screenHeight(context) * 25,
                            width: screenWidth(context) * 40,
                         //   transform:  Matrix4.rotationZ(1),
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                      
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('images/logo.png'),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 100,
                                    offset: Offset(0.5, 0.1),
                                  )
                                ]),
                            child: const Center(
                              child: Text('Login'),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                            height: screenHeight(context) * 25,
                            width: screenWidth(context) * 40,
                       //     transform:  Matrix4.rotationZ(1),
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                      
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('images/logo.png'),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 100,
                                    offset: Offset(0.5, 0.1),
                                  )
                                ]),
                            child: const Center(
                              child: Text('Login'),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                            height: screenHeight(context) * 25,
                            width: screenWidth(context) * 40,
                            //     transform:  Matrix4.rotationZ(1),
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                      
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('images/logo.png'),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 100,
                                    offset: Offset(0.5, 0.1),
                                  )
                                ]),
                            child: const Center(
                              child: Text('Login'),
                            )),
                      ),
                    ),

                  ],
                ),
                Center(
                  child: Container(
                      height: screenHeight(context) * 25,
                      width: screenWidth(context) * 40,
                    //  transform:  Matrix4.rotationZ(1),
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,

                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('images/logo.png'),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 100,
                              offset: Offset(0.5, 0.1),
                            )
                          ]),
                      child: const Center(
                        child: Text('Login'),
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
