import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/constants/app.bar.dart';
import 'package:library_magement_sys/controllers/users.controller/user.controller.dart';

class UserManagement extends StatelessWidget {
   UserManagement({ Key? key }) : super(key: key);
   UserController userController = Get.put(UserController());

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
              'Library Users Management',
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
                            'Name',
                            style: TextStyle(fontSize:18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Last Name',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Roll No',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Course',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Degree',
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
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Role',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                      ],
                      rows: userController.allUserslist.map((user) => DataRow(
                          cells: <DataCell>[
                             DataCell(Text(
                              user.name,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              user.lastName,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              user.rollNumber,
                              style:const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              user.course,
                              style: const TextStyle(fontSize: 16),
                            )),
                            DataCell(Text(
                              user.degree,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(
                               Text(
                              user.email,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              user.phoneNumber,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(Text(
                              user.role,
                              style: const TextStyle(fontSize: 16),
                            )),
                             DataCell(
                                      Row(
                                        children: [
                                  //         IconButton(
                                  //    icon: const Icon(Icons.edit),
                                  //    color: Colors.blue[700],
                                  //    onPressed: () {},
                                  // ),
                                  IconButton(
                                     icon: const Icon(Icons.delete),
                                     color: Colors.red[700],
                                     onPressed: () {
                                      //  Get.defaultDialog(
                                      //     middleText: 'Are you sure you want to delete',
                                      //     textConfirm: 'Delete',
                                      //     confirmTextColor: Colors.white,
                                      //     onConfirm: (){
                                      //        bookController.deleteABook(book.id);
                                      //       setState(() {
                                      //         bookController;
                                      //       });
                                      //     },
                                      //     buttonColor: Colors.red
                                      //   );
                                     },
                                  ),
                                        ],
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