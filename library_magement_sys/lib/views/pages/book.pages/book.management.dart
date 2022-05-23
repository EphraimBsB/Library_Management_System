import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/constants/book.dialog.dart';
import 'package:library_magement_sys/controllers/books/book.controller.dart';
import 'package:library_magement_sys/controllers/books/book.management.controller.dart';
import 'package:library_magement_sys/constants/app.bar.dart';
import 'package:library_magement_sys/views/dialogs/snack.bar.dart';

class BooksManagement extends StatefulWidget {
   BooksManagement({ Key? key }) : super(key: key);

  @override
  State<BooksManagement> createState() => _BooksManagementState();
}

class _BooksManagementState extends State<BooksManagement> {
  final BookManagementController bookController = Get.put(BookManagementController());
  final BookController Controller = Get.put(BookController());

  var buttonState = false;
  var loanbuttonState = false;
  
  @override
  Widget build(BuildContext context) {
    bookController;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var Snackbar = SnackBarDialog();
    
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
        child: Scaffold(
          appBar: AppBar(
          title: const AppBarwidget(),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          toolbarHeight: 70,
          titleSpacing: 0,
          ),
          body: ScrollConfiguration(
             behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                    TextButton(
                     onPressed: (){
                       var showDial = BookDialog();
                       showDial.addBookDialog('Add Book',context);
                     },
                     child: Container(
                     alignment: Alignment.center,
                     width: 105,
                     height: 40,
                     decoration: const BoxDecoration(
                       color: Color.fromRGBO(5, 38, 154, 5),
                       borderRadius: BorderRadius.all(Radius.circular(5)),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: const [
                         Icon(
                           Icons.add,
                           color: Colors.white,
                           size: 20,
                         ),
                         SizedBox(
                           width: 5,
                         ),
                         Text(
                           'Add Book',
                           style: TextStyle(
                             color: Colors.white,
                           ),
                         ),
                       ],
                     ),
                     )
                  ),
                  const  SizedBox(
                     width: 60,
                   ),
                   TextButton(
                     onPressed: ()async{
                      final books = await FilePickerWeb.platform.pickFiles();
                           if(books == null) return;
                           final file = books.files.first;
                           print('Name ${file.name}');
                     }, 
                     child: Container(
                     alignment: Alignment.center,
                     width: 140,
                     height: 40,
                     decoration:  BoxDecoration(
                       color: Colors.green.shade400,
                       borderRadius: const BorderRadius.all(Radius.circular(5)),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:  const [
                          Icon(
                           Icons.arrow_downward,
                           color: Colors.white,
                           size: 20,
                         ),
                         SizedBox(
                           width: 5,
                         ),
                         Text(
                           'Import Excel',
                           style: TextStyle(
                             color: Colors.white 
                            ),),
                       ],
                     ),
                     ),
                  ),
                  const SizedBox(width: 60,),
                  TextButton(
                     onPressed: (){
                       bookController.exportExcel();
                       setState(() {
                         buttonState = true;
                       });
                     }, 
                     child: Container(
                     alignment: Alignment.center,
                     width: 150,
                     height: 40,
                     decoration:  BoxDecoration(
                       color: buttonState ? Colors.green.shade400 : Colors.white,
                       borderRadius: const BorderRadius.all(Radius.circular(5)),
                       border: Border.all(
                         color: Colors.green.shade400,
                           width: 2,
                      ),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:  [
                          Icon(
                           Icons.arrow_upward,
                           color: buttonState ? Colors.white : Colors.black,
                           size: 20,
                         ),
                         const SizedBox(
                           width: 5,
                         ),
                         Text(
                           'Export to Excel',
                           style: TextStyle(
                             color: buttonState ? Colors.white : Colors.black,
                            ),),
                       ],
                     ),
                     ),
                  ),
                  const  SizedBox(
                     width: 60,
                   ),
                  TextButton(
                     onPressed: (){
                       Get.toNamed("/loans_management");
                       setState(() {
                         loanbuttonState = true;
                       });
                     }, 
                     child: Container(
                     alignment: Alignment.center,
                     width: 100,
                     height: 40,
                     decoration:  BoxDecoration(
                       color: loanbuttonState ? const Color.fromRGBO(5, 38, 154, 5) : Colors.white,
                       borderRadius:  const BorderRadius.all(Radius.circular(5)),
                       border: Border.all(
                         color: const Color.fromRGBO(5, 38, 154, 5),
                           width: 2,
                      ),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:  [
                         Icon(
                           Icons.menu_book,
                           color: loanbuttonState ? Colors.white : Colors.black,
                           size: 20,
                         ),
                         const SizedBox(
                           width: 5,
                         ),
                         Text(
                           'Loans',
                           style: TextStyle(
                             color: loanbuttonState ? Colors.white : Colors.black,
                           ),
                         ),
                       ],
                     ),
                     )
                  ),
                   ],
                  ),   
                    
                   const SizedBox(
                     height: 50,
                    ),
                  
                    Obx(() => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    showCheckboxColumn: false,
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Image',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Title',
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
                                'DDC No',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'ACC No',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            // DataColumn(
                            //   label: Text(
                            //     'Pub Year',
                            //     style: TextStyle(fontSize: 18),
                            //   ),
                            // ),
                            DataColumn(
                              label: Text(
                                'Subjects',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                             DataColumn(
                              label: Text(
                                'Copies',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Status',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                          rows: bookController.allbookslist.map((book) =>  DataRow(
                            onSelectChanged: (bool? selected) {
                             if (selected!) {
                                Get.toNamed("/books/single_book/${book.id}");
                                Controller.findOneBook();
                             }
                               },
                              cells: <DataCell>[
                                DataCell(
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: SizedBox(
                                height: 90,
                                width: 50,
                                child: book.image.contains('uploaded_files')?Image.network(
                                  'http://192.168.56.1:5000/${book.image}',
                                  fit: BoxFit.cover,
                                ):Image.network(
                                  book.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                                  ),),
                                 DataCell(SizedBox(
                                  height: 50,
                                  width: 200,
                                  child: Text(
                                    book.title,
                                    style: const TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )),
                                 DataCell(SizedBox(
                                  height: 50,
                                  width: 200,
                                  child: Text(
                                    book.author,
                                    style: const TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )),
                                 DataCell(SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: Text(
                                    book.ddc,
                                    style: const TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )),
                                DataCell(SizedBox(
                                  height: 50,
                                  width: 200,
                                  child: Text(
                                    book.acc_num,
                                    style: const TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )),
                                // DataCell(SizedBox(
                                //   height: 50,
                                //   width: 150,
                                //   child: Text(
                                //     book.pub_year,
                                //     style: const TextStyle(fontSize: 16),
                                //     overflow: TextOverflow.ellipsis,
                                //     maxLines: 1,
                                //   ),
                                // )),
                                 DataCell(Text(
                                  book.subjects,
                                  style: const TextStyle(fontSize: 16),
                                )),
                                DataCell(Text(
                                  book.copies,
                                  style: const TextStyle(fontSize: 16),
                                )),
                                 DataCell(Text(
                                  book.status,
                                  style: const TextStyle(fontSize: 16),
                                )),
                                 
                                //   DataCell(
                                //     Row(
                                //       children: [
                                //         IconButton(
                                //    icon: const Icon(Icons.edit),
                                //    color: Colors.blue[700],
                                //    onPressed: () {},
                                // ),
                                // IconButton(
                                //    icon: const Icon(Icons.delete),
                                //    color: Colors.red[700],
                                //    onPressed: () {
                                //      Get.defaultDialog(
                                //         middleText: 'Are you sure you want to delete',
                                //         textConfirm: 'Delete',
                                //         confirmTextColor: Colors.white,
                                //         onConfirm: (){
                                //            bookController.deleteABook(book.id);
                                //           setState(() {
                                //             bookController;
                                //           });
                                //         },
                                //         buttonColor: Colors.red
                                //       );
                                    
                                //    },
                                // ),
                                //       ],
                                //     )
                                //     ),
                              ],
                            ),).toList()
                        ),
                    ), 
                    ),
                    
                ]
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                  ),
                  child: Text('Settings'),
                ),
                ListTile(
                  title: const Text('Register Student'),
                  onTap: () {
                    Get.toNamed("/register");
                  },
                ),
                ListTile(
                  title: const Text('All Users'),
                  onTap: () {
                    Get.toNamed("/users_management");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}