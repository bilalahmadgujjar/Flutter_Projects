
import 'package:first_project/Chapter_8_Calculator/constant.dart';
import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';
class My_Button extends StatelessWidget {
  const My_Button({super.key, required this.text,  this.color =const Color(0xFFa5a5a5), required this.onpress,});

  final String text;
  final Color color;
  final VoidCallback onpress;


  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: screenHeight(context)*8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,

              // borderRadius: BorderRadius.circular(30),
            ),
            child: Center(child: Text(text,style: headingTextStyle,)),
          ),
        ),
      ),
    );
  }
}