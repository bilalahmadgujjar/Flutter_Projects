import 'package:first_project/responsive.dart';
import 'package:flutter/material.dart';

class Size_Box extends StatelessWidget {
  const Size_Box({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: screenHeight(context)*5,),

            const Divider(color: Colors.green,thickness: 2,),
            SizedBox(height: screenHeight(context)*2,),
            SizedBox(height: screenHeight(context)*10, child: const VerticalDivider(color: Colors.blue,)),
            SizedBox(height: screenHeight(context)*2,),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Rich',
                  children: [
                    const TextSpan(
                      text: 'Lower',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    WidgetSpan(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1, // Use MediaQuery to get the screen width
                      ),
                    ),
                    const TextSpan(
                      text: 'Lower',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
