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
                  FadeAnimatedText(
                   'Welcome to ISBAT University Library Management System',
                textStyle: const TextStyle(
                  color: Color.fromRGBO(5, 38, 154, 5),
                  fontSize: 70,
                ),
                duration :const Duration(milliseconds: 20000),
                textAlign: TextAlign.center,),
    
            ],
            repeatForever: true,
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