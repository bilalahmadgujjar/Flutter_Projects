
import 'package:first_project/Chapter_8_Calculator/components/My_Buttons.dart';
import 'package:first_project/Chapter_8_Calculator/constant.dart';
import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class Calculator extends StatefulWidget {
   const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';

  var answer = '';

  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: ThemeData(
        brightness: Brightness.dark,
      ),
      child: Scaffold(
backgroundColor: Colors.black,
        body: SafeArea(

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
Expanded(
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
  crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(userInput.toString(),textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: screenHeight(context)*5),),
        Text(answer.toString(),style: TextStyle(color: Colors.white,fontSize: screenHeight(context)*5),),

      ],
    ),
  ),
),


                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          My_Button(text: 'AC', onpress: () {
                            userInput= '';
                            answer = '';
                            setState(() {

                            });

                          },),
                          My_Button(text: '+/-', onpress: () {
                            userInput = '$userInput+/-';
                            setState(() {

                            });

                          },),
                          My_Button(text: '%', onpress: () {
                            userInput = '$userInput%';
                            setState(() {

                            });
                          },),
                          My_Button(text: '/',color: korange, onpress: () {
                            userInput = '$userInput/';
                            setState(() {

                            });
                          },),
                        ],
                      ),
                      Row(
                        children: [
                          My_Button(text: '7', onpress: () {
                            userInput = '${userInput}7';
                            setState(() {

                            });
                          },),
                          My_Button(text: '8', onpress: () {
                            userInput = '${userInput}8';
                            setState(() {

                            });

                          },),
                          My_Button(text: '9', onpress: () {

                            userInput = '${userInput}9';
                            setState(() {

                            });
                          },),
                          My_Button(text: 'x',color: korange, onpress: () {
                            userInput = '${userInput}x';
                            setState(() {

                            });
                          },),
                        ],
                      ),
                      Row(
                        children: [
                          My_Button(text: '4', onpress: () {  },),
                          My_Button(text: '5', onpress: () {  },),
                          My_Button(text: '6', onpress: () {  },),
                          My_Button(text: '-',color: korange, onpress: () {  },),
                        ],
                      ) ,
                      Row(
                        children: [
                          My_Button(text: '1', onpress: () {  },),
                          My_Button(text: '2', onpress: () {  },),
                          My_Button(text: '3', onpress: () {  },),
                          My_Button(text: '+',color: korange, onpress: () {  },),
                        ],
                      ),
                      Row(
                        children: [
                          My_Button(text: '0', onpress: () {  },),
                          My_Button(text: '.', onpress: () {  },),
                          My_Button(text: 'DEL', onpress: () {

                            userInput = userInput.substring(0,userInput.length-1);
                            setState(() {

                            });

                          },),
                          My_Button(text: '=',color: korange, onpress: () {
                            equalPress();
                            setState(() {

                            });

                          },),
                        ],
                      ),

                    ],
                  ),
                )



              ],
            ),
          ),
        ),
      ),
    );
  }


  void equalPress()
  {
    String finalUserInput =userInput;
    finalUserInput= userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}



