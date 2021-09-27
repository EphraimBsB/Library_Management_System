import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library_magement_sys/controllers/loans/loan.controller.dart';
import 'package:library_magement_sys/models/book.model/single.book.model.dart';
import 'package:library_magement_sys/views/widgets/app.bar.dart';

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
               children: [
                 SizedBox(
                   height: 500,
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
                         style: const TextStyle(
                             fontSize: 18, color: Color.fromRGBO(0, 0, 0, 5)),
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
                   book.status == 'borrowed'? Text(
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
                 const SizedBox(
                   //margin: EdgeInsets.only(top: 110),
                   width: 700,
                   height: 450,
                   child: Text(
                     'Electrical technology, as a subject, covers various divisions of electrical engineering like basic electrical engineering, electronics, control systems, instrumentation and communication systems. For close to 60 years, A Textbook of Electrical Technology: Volume III {Transmission, Distribution and Utilization} discusses and explains various theories related to Transmission, Distribution and Utilization aspects of Electrical technology. Coverage of topics such as Rating & Service Capacity and Distribution Automation as full chapters illustrate the depth provided within the text in a succinct manner.',
                     style: TextStyle(
                       fontSize: 18,
                     ),
                   ),
                 ),
               ],
             ),
             
              const SizedBox(
                   height: 20,
                 ),
              Center(
               child: Text(
                     'To : Block ${book.location.block},  Column : ${book.location.column},  Section: ${book.location.section},  Row : ${book.location.row},  DDC : ${book.location.ddc}',
                     style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                   ),
             ),
         ],
         );
  }
}
