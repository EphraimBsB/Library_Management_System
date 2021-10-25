import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:library_magement_sys/controllers/books/book.management.controller.dart';
import 'package:library_magement_sys/constants/app.bar.dart';
import 'package:library_magement_sys/constants/text.field.dart';
import 'package:library_magement_sys/views/dialogs/snack.bar.dart';

class BooksManagement extends StatefulWidget {
   BooksManagement({ Key? key }) : super(key: key);

  @override
  State<BooksManagement> createState() => _BooksManagementState();
}

class _BooksManagementState extends State<BooksManagement> {
  final BookManagementController bookController = Get.put(BookManagementController());

  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController ddc = TextEditingController();
  TextEditingController accNumber = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController copies = TextEditingController();
  TextEditingController imageUrl = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController column = TextEditingController();
  TextEditingController row = TextEditingController();
  var buttonState = false;
  var loanbuttonState = false;
  var _currentSelectedValue;
  final _currencies = [
    "Computer",
    "Engineering",
    "Business",
    "General",
    "Projects",
    "Indian"
  ];
  @override
  Widget build(BuildContext context) {
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
                    'Add a Book',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const  SizedBox(
                      height: 20,
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldWidget(label: 'Title', controller: title,),
                    TextFieldWidget(label: 'DDC Number', controller: ddc,),
                  ],
                ),
                  
                  const  SizedBox(
                      height: 20,
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldWidget(label: 'Author', controller: author,),
                    TextFieldWidget(label: 'AC Number', controller: accNumber,),
                  ],
                ),
                  const  SizedBox(
                      height: 20,
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                SizedBox(
                  width: 0.4*width,
                  height: 50,
                  child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                  return InputDecorator(
                  decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                  isEmpty: _currentSelectedValue == '',
                  child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                  value: _currentSelectedValue,
                  isDense: true,
                  onChanged: ( newValue) {
                    setState(() {
                      _currentSelectedValue = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: _currencies.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
                ),

                    // TextFieldWidget(label: 'Category', controller: category,),
                   TextFieldWidget(label: 'Copies', controller: copies,),
                  ],
                ),
                 const  SizedBox(
                      height: 20,
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 0.4*width,
                      height: 200,
                      child: TextField(
                        controller: description,
                         keyboardType: TextInputType.multiline,
                          maxLines: 20,
                        decoration: const InputDecoration(
                            label: Text('Description'),
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       TextFieldWidget(label: 'Image Url', controller: imageUrl,),
                       const  SizedBox(
                      height: 10,
                    ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left:45),
                      child: Text(
                      'Book Location',
                      style: TextStyle(
                      fontSize: 20,
                  ),
                ),
                    ),
                  ),
                  const  SizedBox(
                      height: 10,
                    ),
                 Row(
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
                       const  SizedBox(
                      width: 20,
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
                       const  SizedBox(
                      width: 20,
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
                  ]
                  ),
                  const  SizedBox(
                      height: 20,
                    ),
                 Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                       TextButton(
                        onPressed: (){
                          String titleText = title.text;
                          String authorText = author.text;
                          String descriptionText = description.text;
                          String ddcText = ddc.text;
                          String accNumberText = accNumber.text;
                          String categoryText = _currentSelectedValue;
                          String copiesText = copies.text;
                          String imageUrlText = imageUrl.text;
                          String blockText = block.text;
                          String columnText = column.text;
                          String rowText = row.text;
                          if(
                            titleText.isEmpty || authorText.isEmpty || descriptionText.isEmpty || 
                            ddcText.isEmpty || accNumberText.isEmpty|| categoryText == '' ||
                            copiesText.isEmpty|| imageUrlText.isEmpty|| 
                            blockText.isEmpty || columnText.isEmpty ||rowText.isEmpty){
                              Snackbar.dialog('Please fill out all the inputs ', Colors.red);
                          }else{
                          bookController.createdBooks(titleText, authorText, descriptionText, ddcText, accNumberText, categoryText, copiesText, imageUrlText,blockText, columnText,rowText);
                          setState(() {});
                         }
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
                     const  SizedBox(
                    width: 60,
                  ),
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
                     ],
                   ),
                  ],
                ),   
                  
                 const SizedBox(
                       height: 50,
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
                                  'Description',
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
                              DataColumn(
                                label: Text(
                                  'Category',
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
                              DataColumn(
                                label: Text(
                                  'Added',
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
                            rows: bookController.allbookslist.map((book) =>  DataRow(
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
                                   DataCell(Text(
                                    book.author,
                                    style: const TextStyle(fontSize: 16),
                                  )),
                                  DataCell(SizedBox(
                                    height: 50,
                                    width: 200,
                                    child: Text(
                                      book.description,
                                      style: const TextStyle(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
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
                                  DataCell(Text(
                                    '${book.copies}',
                                    style: const TextStyle(fontSize: 16),
                                  )),
                                   DataCell(
                                     Text(
                                    book.status,
                                    style: const TextStyle(fontSize: 16),
                                  )),
                                   DataCell(
                                     Text(
                                    DateFormat.yMMMd().format(book.createdAt),
                                    style: const TextStyle(fontSize: 16),
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
                    Get.toNamed("/register");
                  },
                ),
                ListTile(
                  title: const Text('All Users'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}