import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/constants/app.bar.dart';
import 'package:library_magement_sys/controllers/loans/loan.controller.dart';
import 'package:library_magement_sys/models/loan.model/single.loan.model.dart';

class ShowSingleLoanWidget extends StatelessWidget {
  final SingleLoans loan;
  Function callback;
    LoanController loanController =  Get.put(LoanController());
   ShowSingleLoanWidget(
     this.loan,
     this.callback,
  ) ;

  @override
  Widget build(BuildContext context) {
    var action = '';
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const AppBarwidget(),
           Container(height: height*0.1,),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   height: 600,
                   width: 250,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       SizedBox(
                         height: 330,
                         width: 250,
                         child: Image.network(
                         loan.book.image,
                         fit: BoxFit.cover,
                       ),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                         Text(
                         'Title: ${loan.book.title}',
                         maxLines: 2,
                         style: const TextStyle(
                             fontSize: 18, color: Color.fromRGBO(0, 0, 0, 5)),
                             overflow: TextOverflow.ellipsis,
                       ),
                       const SizedBox(
                         height: 5,
                       ),
                         Text(
                         'Author: ${loan.book.author}',
                         style: const TextStyle(
                             fontSize: 18, color: Color.fromRGBO(0, 0, 0, 5)),
                       ),
                       const SizedBox(
                         height: 5,
                       ),
                         Text(
                         'DDC: ${loan.book.ddc}',
                         style: const TextStyle(
                             fontSize: 18, color: Color.fromRGBO(0, 0, 0, 5)),
                       ),
                       const SizedBox(
                         height: 5,
                       ),
                         
                        Text(
                         'Student: ${loan.user.name}'' ${loan.user.lastName}',
                         style: const TextStyle(
                             fontSize: 18, color: Color.fromRGBO(0, 0, 0, 5)),
                       ),
                       const SizedBox(
                         height: 5,
                       ),
                        Text(
                         'Roll Number: ${loan.user.rollNumber}',
                         style: const TextStyle(
                             fontSize: 18, color: Color.fromRGBO(0, 0, 0, 5)),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                       Text(
                         'Loan Status: ${loan.status}',
                         style: const TextStyle(
                             fontSize: 18, color: Color.fromRGBO(0, 0, 0, 5)),
                       ),
                       const SizedBox(
                         height: 5,
                       ),
                         Text(
                         'Book Status: ${loan.book.status}',
                         style: const TextStyle(
                             fontSize: 18, color: Color.fromRGBO(0, 0, 0, 5)),
                       ),
                       
                     ],
                   ),
                 ),
                  const SizedBox(
                   width: 40,
                 ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                      SizedBox(
                       width: 700,
                       height: 250,
                       child: Text(
                         loan.book.description,
                         style: const TextStyle(
                           fontSize: 18,
                         ),
                       ),
                     ),
                     const SizedBox(
                   height: 150,
                 ),
                     Container(
                   alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(5, 38, 154, 5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                   child: TextButton(
                      onPressed: (){
                        action = 'return';
                        loanController.singleLoanController(action);
                        callback();
                      }, 
                      child: const Text('Return Book',
                      style: TextStyle(
                              color: Colors.white
                            ),)
                   ),
             ),
                   ],
                 ),
                 
               ],
             ),
             
         ],
         );
  }
}
