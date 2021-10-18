import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/controllers/loans/loan.controller.dart';
import 'package:library_magement_sys/views/widgets/show.single.loan.dart';

class SingleLoan extends StatefulWidget {
    SingleLoan({ Key? key, }) : super(key: key);

  @override
  State<SingleLoan> createState() => _SingleLoanState();
}

class _SingleLoanState extends State<SingleLoan> {
   final LoanController loanController = Get.put(LoanController());
  @override
  void initState() {
    super.initState();
    loanController.singleLoanController('');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
        itemCount:loanController.singleLoanList.length ,
        itemBuilder: (context, index){
                   return ShowSingleLoanWidget(loanController.singleLoanList[index], callback);
                 },   
        )
      ) 
    );
  }

    callback() {
    setState(() {});
  }
}