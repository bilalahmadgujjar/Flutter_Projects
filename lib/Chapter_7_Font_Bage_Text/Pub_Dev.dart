
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:badges/badges.dart' as badges;
import 'package:pin_code_fields/pin_code_fields.dart';

class Pub_Dev extends StatelessWidget {
  const Pub_Dev({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //This is icon for android mobile
                const Text('Android Icons'),
                const Icon(Icons.home),
                //This is icon for i phone
                const Text('I Phone Icons'),
                const Icon(
                  CupertinoIcons.home,
                  color: Colors.pink,
                  size: 24.0,
                ),

                // This is Font Awesome Font Icons
                const Text('Font Awesome Icons'),
                const Icon(FontAwesomeIcons.house),

                // This is package use for the readmore text and see less in the app
                const ReadMoreText(
                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  colorClickableText: Colors.pink,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),

                ///TODO This is badge widget
                const badges.Badge(
                  showBadge: true,
                  badgeAnimation: badges.BadgeAnimation.fade(
                    animationDuration: Duration(seconds: 3),
                  ),
                  badgeContent: Text(
                    '5',
                    style: TextStyle(color: Colors.white),
                  ),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.teal,
                  ),
                  child: Icon(Icons.notifications),
                ),

                ///TODO Animated Text Kit

                   PinCodeTextField(appContext: context, length: 6,
                   obscureText: true,
                     obscuringCharacter: '*',
                     pinTheme: PinTheme(
                       shape: PinCodeFieldShape.box,
                       borderRadius: BorderRadius.circular(5),
                       activeColor: Colors.blue,
                       inactiveColor: Colors.black,
                     ),
           onChanged: (value)
                     {

                     },
                   ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
