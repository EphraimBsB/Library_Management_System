import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:library_magement_sys/models/loan.model/loan.model.dart';

class StudentLoanWidget extends StatelessWidget {

  final Loans student;
  
   StudentLoanWidget(this.student);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
                Row(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        margin: const EdgeInsets.only(left: 30),
                        decoration: const BoxDecoration(
                            // border: Border.all(color: Colors.black, width: 2),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/ephraim.png'),
                              fit: BoxFit.contain,
                            )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            'Name: ${student.user.name} ',
                            style:const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                         const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Last Name: ${student.user.lastName}',
                            style:const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                         const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Roll Number: ${student.user.rollNumber}',
                            style:const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const Text(
                            'Course: Bsc.CE',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                  //     Container(width: width*0.17,),
                  //     const Center(
                  //        child:  Text(
                  //   'Loan Books',
                  //   style: TextStyle(
                  //     fontSize: 30,
                  //   ),
                  // ),
                  //      ),
                    ],
                  ),
                      const  SizedBox(
                height: 50,
              ),
      
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Image',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Title',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Author',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'DDC',
                            style: TextStyle(fontSize: 20),
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
                            'Return Date',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Status',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                      rows: student.loans.map((loan) =>  DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SizedBox(
                            height: 90,
                            width: 50,
                            child: Image.network(
                            loan.book.image,
                            fit: BoxFit.cover,
                          ),
                          ),
                              ),),
                             DataCell(Text(
                              loan.book.title,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              loan.book.author,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              loan.book.ddc,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              DateFormat.yMMMd().format(loan.issueDate),
                              style:const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              DateFormat.yMMMd().format(loan.dueDate),
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(
                               Text(
                              loan.returnDate==null?'':DateFormat.yMMMd().format(loan.returnDate!),
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Container(
                             width: 90,
                             height: 25,
                             decoration: BoxDecoration(
                             color: (loan.status == 'overdue')?Colors.red[700]:loan.status == 'returned'?Colors.yellow[700]:Colors.green[700],
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
      ],
    );
              
  }


}
