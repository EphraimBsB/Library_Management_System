import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/constants/book.dialog.dart';
import 'package:library_magement_sys/constants/text.field.dart';

import 'package:library_magement_sys/models/book.model/single.book.model.dart';
import 'package:library_magement_sys/constants/app.bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleBookWidget extends StatefulWidget {

  final SingleBook book;

   SingleBookWidget(this.book);

  @override
  State<SingleBookWidget> createState() => _SingleBookWidgetState();
}

class _SingleBookWidgetState extends State<SingleBookWidget> {
  var id = 0;

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

  var buttonState = false;

  var loanbuttonState = false;

  var _currentSelectedValue;

  var  selectedSide;

  final _categories = [
    "Computer",
    "Engineering",
    "Business",
    "Health",
    "General",
    "Projects",
    "Asian"
  ];

  final _sides = ["Front", "Back"];

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
                 Container(
                   height: 330,
                   width: 250,
                   child: Image.network(
                   widget.book.image,
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
                             widget.book.description,
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
                          TextSpan(text: widget.book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          TextSpan(text: widget.book.author, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          TextSpan(text: widget.book.ddc, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          const TextSpan(text: 'Subject:   '),
                          TextSpan(text: widget.book.subjects, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          const TextSpan(text: 'Copies:   '),
                          TextSpan(text: widget.book.copies, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          const TextSpan(text: 'Shelf:   '),
                          TextSpan(text: widget.book.location.shelf, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          const TextSpan(text: 'Side:   '),
                          TextSpan(text: widget.book.location.side, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          const TextSpan(text: 'Column:   '),
                          TextSpan(text: '${widget.book.location.column}', style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          const TextSpan(text: 'Section:   '),
                          TextSpan(text: widget.book.location.section, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          const TextSpan(text: 'Row:   '),
                          TextSpan(text: '${widget.book.location.row}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  child: Column(
                    children: [
                      TextButton(
                  onPressed: (){
                  var showdial = BookDialog();
                  showdial.editBookDialog(context, subjectDropMenu(), locationSideDropMenu(), _currentSelectedValue, selectedSide);
                  }, 
                  child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
                  decoration:const BoxDecoration(
                  color:  Color.fromRGBO(5, 38, 154, 5),
                  borderRadius:  BorderRadius.all(Radius.circular(5)),
                    ),
                  child:const Text('Edit',
                  style: TextStyle(
                  color: Colors.white,
                  ),),
                )
               ),
               const SizedBox(height: 20,),
                      TextButton(
                      onPressed: (){}, 
                      child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                      color:  Colors.red[700],
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                      child:const Text('Delete',
                      style: TextStyle(
                     color: Colors.white,
                  ),),
                  )
                ),
              ],
              ),
            )
          ],
        ), 
      ],
    );
  }


  subjectDropMenu(){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
              width: width*0.4,
              height: 50,
              child: FormField<String>(
              builder: (FormFieldState<String> state) {
              return InputDecorator(
              decoration: InputDecoration(
              labelText: 'Subjects',
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
              items: _categories.map((String value) {
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
            );
          }
  
  locationSideDropMenu(){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  SizedBox(
                  width: 0.1*width,
                  height: 45,
                  child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                  return InputDecorator(
                  decoration: InputDecoration(
                  labelText: 'Side',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                  isEmpty: selectedSide == '',
                  child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                  value: selectedSide,
                  isDense: true,
                  onChanged: ( newValue) {
                    setState(() {
                      selectedSide = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: _sides.map((String value) {
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
                );
            }
  
}
