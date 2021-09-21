import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: 473,
                height: 133,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/isbat.png'),
                  fit: BoxFit.contain,
                )),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
             Center(
              child: AnimatedTextKit(
                animatedTexts: [
                 TyperAnimatedText( 'Welcome to ISBAT Univerty Library Management System',
                textStyle: const TextStyle(
                  color: Color.fromRGBO(5, 38, 154, 5),
                  fontSize: 70,
                ),
                textAlign: TextAlign.center,
                speed: const Duration(milliseconds: 300),
                ),
                  FadeAnimatedText(
                   'Welcome to ISBAT Univerty Library Management System',
                textStyle: const TextStyle(
                  color: Color.fromRGBO(5, 38, 154, 5),
                  fontSize: 70,
                ),
                textAlign: TextAlign.center,),
                 FadeAnimatedText(
                   'Welcome to ISBAT Univerty Library Management System',
                textStyle: const TextStyle(
                  color: Color.fromRGBO(5, 38, 154, 5),
                  fontSize: 70,
                ),
                textAlign: TextAlign.center,),
                 FadeAnimatedText(
                   'Welcome to ISBAT Univerty Library Management System',
                textStyle: const TextStyle(
                  color: Color.fromRGBO(5, 38, 154, 5),
                  fontSize: 70,
                ),
                textAlign: TextAlign.center,),
    
  ],
  // totalRepeatCount: 4,
  repeatForever: true,
  pause: const Duration(milliseconds: 1000),
  displayFullTextOnTap: true,
  stopPauseOnTap: true,
  onTap: () {
       Get.toNamed("/home");
      },
),
            ),

            
          ],
        ),
      ),

    );
  }
}