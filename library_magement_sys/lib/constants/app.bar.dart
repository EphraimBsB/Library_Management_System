import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarwidget extends StatelessWidget {
  const AppBarwidget({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: 200,
                height: 80,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/EurekaLMS_logo.png'),
                  fit: BoxFit.contain,
                )),
              ),
              Container(width: MediaQuery.of(context).size.width*0.6,),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextButton(onPressed: (){
                  Get.toNamed("/home");
                }, child: const Text("Home"),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextButton(onPressed: (){
                  Get.toNamed('/login');
                }, child: const Text("Student"),),
              )
               
            ],
          );
  }
}