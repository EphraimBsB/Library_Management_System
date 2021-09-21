import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/controllers/loans/loan.controller.dart';
import 'package:library_magement_sys/views/widgets/app.bar.dart';
import 'package:library_magement_sys/views/widgets/std.loan.widget.dart';

class StudentLoanPage extends StatelessWidget {
   StudentLoanPage({ Key? key }) : super(key: key);
   LoanController loanController = Get.put(LoanController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBarwidget(),
            Container(height: height*0.1,),
             const Text(
                'Library',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
             Container(height: height*0.1,),

             ListView.builder(
               shrinkWrap: true,
        itemCount:loanController.studentLoans.length ,
        itemBuilder: (context, index){
                   return StudentLoanWidget(loanController.studentLoans[index]);
                 },   
        ),
          ]    
        ), )
        
       
      ),
    );
  }
}