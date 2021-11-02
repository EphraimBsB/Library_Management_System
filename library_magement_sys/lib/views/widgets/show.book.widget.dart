import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library_magement_sys/controllers/loans/loan.controller.dart';
import 'package:library_magement_sys/models/book.model/single.book.model.dart';
import 'package:library_magement_sys/constants/app.bar.dart';

class ShowBookWidget extends StatelessWidget {

  final SingleBook book;
  
   ShowBookWidget(this.book);
   LoanController loanController = Get.put(LoanController());

  @override
  Widget build(BuildContext context) {
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
                   height: 550,
                   width: 250,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       SizedBox(
                         height: 330,
                         width: 250,
                         child: Image.network(
                         book.image,
                         fit: BoxFit.cover,
                       ),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                        Text(
                         'Title: ${book.title}',
                         maxLines: 2,
                         style: const TextStyle(
                             fontSize: 18, color: Color.fromRGBO(0, 0, 0, 5)),
                             overflow: TextOverflow.ellipsis,
                       ),
                       const SizedBox(
                         height: 5,
                       ),
                        Text(
                         'Author: ${book.author}',
                         maxLines: 2,
                         style: const TextStyle(
                             fontSize: 18, color: Color.fromRGBO(0, 0, 0, 5)),
                             overflow: TextOverflow.ellipsis,
                       ),
                       const SizedBox(
                         height: 5,
                       ),
                        Text(
                         'DDC: ${book.ddc}',
                         style: const TextStyle(
                             fontSize: 18, color: Color.fromRGBO(0, 0, 0, 5)),
                       ),
                        const SizedBox(
                     height: 20,
                   ),
                   book.status == 'Borrowed'? Text(
                         'Status: ${book.status}',
                         style: const TextStyle(
                             fontSize: 18, color: Color.fromRGBO(0, 0, 0, 5)),
                       ): Container(
                   alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(5, 38, 154, 5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                   child: TextButton(
                      onPressed: (){
                        Get.toNamed("/login");
                        loanController.createaLoan(book.id);
                      }, 
                      child: const Text('Borrow',
                      style: TextStyle(
                              color: Colors.white
                            ),)
                   ),
             ),
                     ],
                   ),
                 ),
                  const SizedBox(
                   width: 20,
                 ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                       width: 700,
                       height: 430,
                       child: Text(
                         book.description,
                         style: const TextStyle(
                           fontSize: 18,
                         ),
                       ),
                 ),
                  const SizedBox(
                   height: 30,
                 ),
               Text(
                    'To : Block ${book.location.block},  Column : ${book.location.column},  Section: ${book.location.section},  Row : ${book.location.row},  DDC : ${book.location.ddc}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                    ],
                  ),
               ],
             ),
             
              
         ],
         );
  }
}
