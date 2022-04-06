import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: 473,
                height: 133,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/EurekaLMS_logo.png'),
                  fit: BoxFit.contain,
                )),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            const Text(
              'Welcome to Wonder Knowledge',
              style: TextStyle(
                  color: Color.fromRGBO(5, 38, 154, 5),
                  fontSize: 70,
                ),
            ),
             Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                   ' Library Management System',
                textStyle: const TextStyle(
                  color: Color.fromRGBO(5, 38, 154, 5),
                  fontSize: 60,
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