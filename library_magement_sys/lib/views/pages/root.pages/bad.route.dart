import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/constants/app.bar.dart';
import 'package:library_magement_sys/constants/button.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppBarwidget(),
              Container(height: height*0.2,),
         const Text(
           '404',
           style: TextStyle(
             fontSize: 100,
             color: Colors.grey
           ),
           ),
          const SizedBox(height: 20,),
          const Text(
            "Oops, sorry we can't find that page!",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontStyle: FontStyle.normal
            ),
            ),
          const SizedBox(height: 20,),
          TextButton(
              onPressed: gobackHome, 
              child: Container(
              alignment: Alignment.center,
              width: 150,
              height: 40,
              decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius:  BorderRadius.all(Radius.circular(5)),
                ),
              child: Row(
                children: const [
                   Icon(
                        Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                      ),
                  Text('Back to home page',
                  style: TextStyle(
                         color: Colors.white,
                      ),),
                ],
              ),
            )
          ),
        ],
        ),
    );
  }
  gobackHome(){
    Get.toNamed("/home");
  }
}