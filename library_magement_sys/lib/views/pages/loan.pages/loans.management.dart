import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:library_magement_sys/controllers/books/book.controller.dart';
import 'package:library_magement_sys/controllers/books/book.management.controller.dart';
import 'package:library_magement_sys/controllers/loans/loan.controller.dart';
import 'package:library_magement_sys/constants/app.bar.dart';

class LoansManagement extends StatelessWidget {
   LoansManagement({ Key? key }) : super(key: key);
   LoanController loanController = Get.put(LoanController());

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppBarwidget(),
              Container(height: 30,),
              const Text(
              'Students Loans',
              style: TextStyle(
                fontSize: 24,
              ),
                ),
                const  SizedBox(
                height: 20,
              ),
              Obx(() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                showCheckboxColumn: false,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Book Title',
                            style: TextStyle(fontSize:18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Author',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Student',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Email',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Phone No',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                            label: Text(
                              'Issue Date',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Due Date',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Return',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        DataColumn(
                          label: Text(
                            'Status',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                      rows: loanController.loansList.map((loan) => DataRow(
                          onSelectChanged: (bool? selected) {
                          if (selected!) {
                            Get.toNamed("/loans_management/loan/${loan.id}");
                            loanController.singleLoanController('');
                          }
                           },
                          cells: <DataCell>[
                             DataCell(Text(
                              loan.book.title,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              loan.book.author,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              loan.user.name +' ${loan.user.lastName}',
                              style:const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              loan.user.email,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(
                               Text(
                              loan.user.phoneNumber,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              DateFormat.yMMMd().format(loan.issueDate),
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              DateFormat.yMMMd().format(loan.dueDate),
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              loan.returnDate==null?'':DateFormat.yMMMd().format(loan.returnDate!),
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Container(
                               width: 90,
                               height: 25,
                               decoration: BoxDecoration(
                               color: (loan.status == 'Overdue')?Colors.red[700]:loan.status == 'Returned'?Colors.yellow[700]:Colors.green[700],
                               borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                               child: Center(
                                 child: Text(
                                  loan.status,
                                  style:const TextStyle(fontSize: 16, color: Colors.white),textAlign: TextAlign.center,
                            ),
                               ),
                             )),
                          ],
                        ),).toList()
                    
                    ),
                ), 
              )
                
            ]
          ),
        ),
      )
    );
  }
}