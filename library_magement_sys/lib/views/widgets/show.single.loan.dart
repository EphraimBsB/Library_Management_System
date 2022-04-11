import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/constants/app.bar.dart';
import 'package:library_magement_sys/constants/text.field.dart';
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
  TextEditingController access = TextEditingController();

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
                 Container(
                   height: 330,
                   width: 250,
                   child: Image.network(
                   loan.book.image,
                   fit: BoxFit.cover,
                 ),
                 ),
                 const SizedBox(width: 20,),
                 Container(
                       width: 700,
                       height: 330,
                       child: ScrollConfiguration(
                         behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                         child: SingleChildScrollView(
                           scrollDirection: Axis.vertical,
                           child: Text(
                             loan.book.description,
                             style: const TextStyle(
                               fontSize: 18,
                             ),
                           ),
                         ),
                       ),
                 ),
               ],
             ),
             const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 420,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        maxLines: 2,
                        text: TextSpan(
                        style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Title:   '),
                          TextSpan(text: loan.book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                 const SizedBox(height: 5,),
                 RichText(
                        maxLines: 2,
                        text: TextSpan(
                        style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Author:   '),
                          TextSpan(text: loan.book.author, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                 const SizedBox(height: 5,),
                 RichText(
                        maxLines: 2,
                        text: TextSpan(
                        style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'DDC:   '),
                          TextSpan(text: loan.book.ddc, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                 const SizedBox(height: 5),
                 RichText(
                        maxLines: 2,
                        text: TextSpan(
                        style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Book Acc No:   '),
                          TextSpan(text: loan.bookAccNo, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                    ],
                  ),
                ),
                Container(
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        maxLines: 2,
                        text: TextSpan(
                        style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Student:   '),
                          TextSpan(text: loan.user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(text: ' ', style:  TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: loan.user.lastName, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                      const SizedBox(height: 5,),
                      RichText(
                        maxLines: 2,
                        text: TextSpan(
                        style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Roll Number:   '),
                          TextSpan(text: loan.user.rollNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                 const SizedBox(height: 5,),
                 RichText(
                        maxLines: 2,
                        text: TextSpan(
                        style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Loan Status:   '),
                          TextSpan(text: loan.status, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                 const SizedBox(height: 5,),
                 RichText(
                        maxLines: 2,
                        text: TextSpan(
                        style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Book Status:   '),
                          TextSpan(text: loan.book.status, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  child: Column(
                    children: [
                      Container(
                   height: 40,
                   child:  TextField(
                     controller: access,
                     decoration:const InputDecoration(
                       label: Text('Book access number'),
                       border:  OutlineInputBorder()
                     ),
                   ),
                 ),
               const SizedBox(height: 20,),
                      TextButton(
                      onPressed: (){
                            String accessText = access.text.trim();
                            action = 'return';
                            loanController.singleLoanController(action, accessText);
                            callback();
                          }, 
                      child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: const BoxDecoration(
                      color:  Color.fromRGBO(5, 38, 154, 5),
                      borderRadius:  BorderRadius.all(Radius.circular(5)),
                        ),
                      child:const Text('Return Book',
                      style: TextStyle(
                     color: Colors.white,
                  ),),
            )
          ),
          const SizedBox(height: 20,),
          

                    ],
                  ),
                )
              ],
            ), 
         ],
         );
  }
}
