import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/controllers/books/book.controller.dart';
import 'package:library_magement_sys/controllers/books/book.management.controller.dart';
import 'package:library_magement_sys/views/widgets/app.bar.dart';
import 'package:library_magement_sys/views/widgets/text.field.dart';

class BooksManagement extends StatelessWidget {
   BooksManagement({ Key? key }) : super(key: key);
  final BookManagementController? bookController = Get.put(BookManagementController());
  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController ddc = TextEditingController();
  TextEditingController accNumber = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController imageUrl = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController column = TextEditingController();
  TextEditingController row = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bookController!.allCreatedBooks();
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
      // automaticallyImplyLeading: false,
      title: const AppBarwidget(),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      toolbarHeight: 70,
      titleSpacing: 0,
      //  leadingWidth: 5000,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const AppBarwidget(),
            Column(
               mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: 30,),
            const Text(
                'Create a Book',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const  SizedBox(
                  height: 20,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFieldWidget(label: 'Title', controller: title,),
                TextFieldWidget(label: 'Author', controller: author,),
              ],
            ),
              
              const  SizedBox(
                  height: 20,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFieldWidget(label: 'DDC Number', controller: ddc,),
                TextFieldWidget(label: 'AC Number', controller: accNumber,),
              ],
            ),
              const  SizedBox(
                  height: 20,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFieldWidget(label: 'Category', controller: category,),
               TextFieldWidget(label: 'Image Url', controller: imageUrl,),
              ],
            ),   
              const  SizedBox(
                  height: 10,
                ),
             const Padding(
               padding: EdgeInsets.only(right: 775),
               child: Text(
                  'Book Location',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
             ),
              const  SizedBox(
                  height: 10,
                ),
             Padding(
               padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   SizedBox(
                       width: 0.1*width,
                       height: 40,
                       child:  TextField(
                         controller: block,
                         decoration: const InputDecoration(
                           label: Text('Shelve'),
                           border: OutlineInputBorder()
                         ),
                       ),
                     ),
                     SizedBox(
                       width: 0.1*width,
                       height: 40,
                       child:  TextField(
                         controller: column,
                         decoration: const InputDecoration(
                           label: Text('Column'),
                           border: OutlineInputBorder()
                         ),
                       ),
                     ),
                     SizedBox(
                       width: 0.1*width,
                       height: 40,
                       child:  TextField(
                         controller: row,
                         decoration: const InputDecoration(
                           label: Text('Row'),
                           border: OutlineInputBorder()
                         ),
                       ),
                     ),
                       SizedBox(
                    width: 0.15*width,
                  ),
                     TextButton(
                      onPressed: (){
                        String titleText = title.text;
                        String authorText = author.text;
                        String ddcText = ddc.text;
                        String accNumberText = accNumber.text;
                        String categoryText = category.text;
                        String imageUrlText = imageUrl.text;
                        String blockText = block.text;
                        String columnText = column.text;
                        String rowText = row.text;
                        bookController!.createdBooks(titleText, authorText, ddcText, accNumberText, categoryText, imageUrlText,blockText,columnText,rowText);
                      }, 
                      child: Container(
                      alignment: Alignment.center,
                      width: 90,
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
                            'Create',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      )
                   ),
                   TextButton(
                      onPressed: (){}, 
                      child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(5, 38, 154, 5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Export to Excel',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      ),
                   ),
                   TextButton(
                      onPressed: (){
                        Get.toNamed("/loans_management");
                      }, 
                      child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(5, 38, 154, 5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.menu_book,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Loans',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      )
                   ),
                ],
            ),
             ), 
             const SizedBox(
                   height: 40,
                  ),
            const Text(
                  'BOOKS',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                   height: 15,
                  ),
              Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
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
                              'DDC Number',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'ACC Number',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Category',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Status',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Created At',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Options',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                        rows: bookController!.allbookslist.map((book) =>  DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: SizedBox(
                              height: 90,
                              width: 50,
                              child: Image.network(
                              book.image,
                              fit: BoxFit.cover,
                            ),
                            ),
                                ),),
                               DataCell(Text(
                                book.title,
                                style: const TextStyle(fontSize: 16),
                              )),
                               DataCell(Text(
                                book.author,
                                style: const TextStyle(fontSize: 16),
                              )),
                               DataCell(Text(
                                book.ddc,
                                style: const TextStyle(fontSize: 16),
                              )),
                               DataCell(Text(
                                '${book.accNumber}',
                                style:const TextStyle(fontSize: 16),
                              )),
                               DataCell(Text(
                                book.category,
                                style: const TextStyle(fontSize: 16),
                              )),
                               DataCell(
                                 Text(
                                book.status,
                                style: const TextStyle(fontSize: 16),
                              )),
                              const DataCell(
                                 Text(
                                '20101010',
                                style: TextStyle(fontSize: 16),
                              )),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                 icon: const Icon(Icons.edit),
                                 color: Colors.blue[700],
                                 onPressed: () {},
                              ),
                              IconButton(
                                 icon: const Icon(Icons.delete),
                                 color: Colors.red[700],
                                 onPressed: () {},
                              ),
                                    ],
                                  )),
                            ],
                          ),).toList()
                      ),
              ), 
              )
              ],
            ),
              
          ]
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
                },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}