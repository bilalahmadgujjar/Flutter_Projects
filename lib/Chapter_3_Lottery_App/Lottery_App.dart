/// Here i will perform the stateless and statefull and ternary operator (that return true and false)and make a
/// lottery app that generate number using random numbers


import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class LotteryApp extends StatefulWidget {
 const LotteryApp({super.key});

  @override
  State<LotteryApp> createState() => _LotteryAppState();
}

class _LotteryAppState extends State<LotteryApp> {
int x=0;
Random random =Random();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Lottery App',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
              'Lottery winnig number is 5'
                ),
              ),

              //x>5 ?  Center(child: Text('x is greater than 5 ${x.toString()}')) :Text(''),
           //   Center(child: Text(x>5 ? 'x is greater than 5' : x.toString())),


              SizedBox(height: screenHeight(context)*2,),
              Container(
                height: screenHeight(context)*30,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),

                  child:  x==5 ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.done_all,color: Colors.greenAccent,size: screenHeight(context)*4,),
                      SizedBox(height: screenHeight(context)*2,),
                       Text('Congragulation you has Won $x\nSucessfully',textAlign: TextAlign.center,),
                    ],
                  ) : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.error,color: Colors.red,size: screenHeight(context)*4,),
                      SizedBox(height: screenHeight(context)*2,),
                      Text('Better luck next time your number is $x\ntry again',textAlign: TextAlign.center,),
                    ],
                  )
                ),
              )
            ],
          )

        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: ()
          {

             setState(() {
                  x= random.nextInt(10);
             });
          },
          child: Icon(x>5 ? Icons.refresh: Icons.place,color: Colors.white,),
        ),
      ),
    );
  }
}
