import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/constants/text.field.dart';
import 'package:library_magement_sys/controllers/books/book.management.controller.dart';
import 'package:library_magement_sys/views/dialogs/snack.bar.dart';

class BookDialog{
  final BookManagementController bookController = Get.put(BookManagementController());
  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController ddc = TextEditingController();
  TextEditingController acc = TextEditingController();
  TextEditingController copies = TextEditingController();
  TextEditingController pubyear = TextEditingController();
  TextEditingController imageUrl = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController side = TextEditingController();
  TextEditingController column = TextEditingController();
  TextEditingController row = TextEditingController();
  var Snackbar = SnackBarDialog();

  addBookDialog(context, subject, locationSide,subjectValue, locationSideValue){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return showDialog(context: context,
    builder: (context){
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
           height: 570,
           width: width*0.9,
           decoration: const BoxDecoration(
             color: Colors.white
           ),
           child:  Column(
                   mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height: 30,),
                const Text(
                    'Add Book',
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
                    TextFieldWidget(label: 'Copies', controller: copies),
                  ],
                ),
                  
                  const  SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldWidget(label: 'Author', controller: author,),
                    TextFieldWidget(label: 'Acc Number', controller: acc,),
                  ],
                ),
                  const  SizedBox(
                      height: 20,
                    ),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldWidget(label: 'DDC Number', controller: ddc,),
                    TextFieldWidget(label: 'Published Year', controller: pubyear,),
                  ],
                ),
                const  SizedBox(
                      height: 20,
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    subject,

                    TextFieldWidget(label: 'Image Url', controller: imageUrl,),
                  ],
                ),
                 const  SizedBox(
                      height: 20,
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: width*0.4,
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
                       SizedBox(
                      width: 0.4*width,
                      height: 40,
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
                        width: 110,
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
                    
                      locationSide,
                    
                       const  SizedBox(
                      width: 20,
                    ),
                       SizedBox(
                         width: 110,
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
                         width: 110,
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
                     TextButton(
                        onPressed: (){
                          
                          String titleText = title.text;
                          String authorText = author.text;
                          String descriptionText = description.text;
                          String ddcText = ddc.text;
                          String accText = acc.text;
                          String subjectsText = subjectValue ?? '' ;
                          String copiesText = copies.text;
                          String pubyearText = pubyear.text;
                          String imageUrlText = imageUrl.text;
                          String sideText = locationSideValue ?? '';
                          String blockText = block.text;
                          String columnText = column.text;
                          String rowText = row.text;
                          if(
                            titleText.isEmpty || authorText.isEmpty || descriptionText.isEmpty || 
                            ddcText.isEmpty || accText.isEmpty || subjectsText == '' || sideText == ''||
                            copiesText.isEmpty|| pubyearText.isEmpty || imageUrlText.isEmpty|| 
                            blockText.isEmpty || columnText.isEmpty ||rowText.isEmpty){
                              Snackbar.dialog('Please fill out all the inputs ', Colors.red);
                          }else{
                          bookController.createdBooks(titleText, authorText, descriptionText, ddcText, accText, subjectsText, copiesText, pubyearText,imageUrlText,blockText, sideText, columnText, rowText);

                          }
                        },
                        child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(5, 38, 154, 5),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child:const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                        ),
                        )
                     ),
                     ],
                   ),
                  ],
                ),
                  ],
           )
         ),
       ),
     );
   });
}

editBookDialog(context, subject, locationSide,subjectValue, locationSideValue){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return showDialog(context: context,
    builder: (context){
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
           height: 570,
           width: width*0.9,
           decoration: const BoxDecoration(
             color: Colors.white
           ),
           child:  Column(
                   mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height: 30,),
                const Text(
                    'Edit Book',
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
                    TextFieldWidget(label: 'Copies', controller: copies),
                  ],
                ),
                  
                  const  SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldWidget(label: 'Author', controller: author,),
                    TextFieldWidget(label: 'Acc Number', controller: acc,),
                  ],
                ),
                  const  SizedBox(
                      height: 20,
                    ),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldWidget(label: 'DDC Number', controller: ddc,),
                    TextFieldWidget(label: 'Published Year', controller: pubyear,),
                  ],
                ),
                const  SizedBox(
                      height: 20,
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    subject,

                    TextFieldWidget(label: 'Image Url', controller: imageUrl,),
                  ],
                ),
                 const  SizedBox(
                      height: 20,
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: width*0.4,
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
                       SizedBox(
                      width: 0.4*width,
                      height: 40,
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
                        width: 110,
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
                    
                      locationSide,
                    
                       const  SizedBox(
                      width: 20,
                    ),
                       SizedBox(
                         width: 110,
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
                         width: 110,
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
                     TextButton(
                        onPressed: (){
                          String titleText = title.text;
                          String authorText = author.text;
                          String descriptionText = description.text;
                          String ddcText = ddc.text;
                          String accText = acc.text;
                          String subjectsText = subjectValue ?? '' ;
                          String copiesText = copies.text;
                          String pubyearText = pubyear.text;
                          String imageUrlText = imageUrl.text;
                          String sideText = locationSideValue ?? '';
                          String blockText = block.text;
                          String columnText = column.text;
                          String rowText = row.text;
                          if(
                            titleText.isEmpty || authorText.isEmpty || descriptionText.isEmpty || 
                            ddcText.isEmpty || accText.isEmpty || subjectsText == '' || sideText == ''||
                            copiesText.isEmpty|| pubyearText.isEmpty || imageUrlText.isEmpty|| 
                            blockText.isEmpty || columnText.isEmpty ||rowText.isEmpty){
                              Snackbar.dialog('Please fill out all the inputs ', Colors.red);
                          }else{
                          bookController.createdBooks(titleText, authorText, descriptionText, ddcText, accText, subjectsText, copiesText, pubyearText,imageUrlText,blockText, sideText, columnText, rowText);

                          }
                        },
                        child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(5, 38, 154, 5),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child:const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                        ),
                        )
                     ),
                     ],
                   ),
                  ],
                ),
                  ],
           )
         ),
       ),
     );
   });
}
}