import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/views/pages/book.pages/home.page.dart';
import 'package:library_magement_sys/views/pages/user.pages/login.page.dart';

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
                height: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/isbat.png'),
                  fit: BoxFit.contain,
                )),
              ),
              Container(width: MediaQuery.of(context).size.width*0.5,),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextButton(onPressed: (){
                  Get.toNamed("/home");
                }, child: const Text("Home"),),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 40),
              //   child: TextButton(onPressed: (){
              //     Get.toNamed("/home");
              //   }, child: const Text("Search"),),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 40),
              //   child: TextButton(onPressed: (){}, child: const Text("All Books"),),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 30, 0),
                child: TextButton(onPressed: (){
                  Get.toNamed('/login');
                }, child: const Text("Student"),),
              )
               
            ],
          );
  }
}