import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library_magement_sys/models/book.model/single.book.model.dart';
import 'package:library_magement_sys/constants/app.bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowBookWidget extends StatelessWidget {

  final SingleBook book;
  var id = 0;
  
   ShowBookWidget(this.book);
   

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
                      book.image,
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
                             book.description,
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
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                            style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                            children: <TextSpan>[
                              const TextSpan(text: 'Title: '),
                              TextSpan(text: book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          )),
                       const SizedBox(height: 5,),
                       RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                          style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Author: '),
                            TextSpan(text: book.author, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        )),
                       const SizedBox(height: 5,),
                       RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                          style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                          children: <TextSpan>[
                            const TextSpan(text: 'DDC: '),
                            TextSpan(text: book.ddc, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        )),
                       const SizedBox(height: 5),
                       RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                          style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Subject: '),
                            TextSpan(text: book.subjects, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        )),
                      const SizedBox(height: 5),
                      RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                          style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Copies: '),
                            TextSpan(text: book.copies, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        )),
                        const SizedBox(height: 20,),
                   book.status == 'Borrowed'? RichText(
                          text: TextSpan(
                          style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Status: '),
                            TextSpan(text: book.status, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        )): Container(
                   alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(5, 38, 154, 5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                   child: TextButton(
                      onPressed: ()async{
                        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                         sharedPreferences.setInt("bookId", book.id);
                        Get.toNamed("/login");
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
                Container(
                  width: 470,
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Book Location', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 5,),
                      RichText(
                        text: TextSpan(
                        style: TextStyle(
                              fontSize: 24.0,
                                color: Colors.red[700],
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Shelf:   '),
                          TextSpan(text: book.location.shelf+',', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                 const SizedBox(height: 5,),
                 RichText(
                        text: TextSpan(
                        style:  TextStyle(
                              fontSize: 24.0,
                                color: Colors.red[700],
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Side:   '),
                          TextSpan(text: book.location.side+',', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                 const SizedBox(height: 5,),
                 RichText(
                        text: TextSpan(
                        style: TextStyle(
                              fontSize: 24.0,
                                color: Colors.red[700],
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Column:   '),
                          TextSpan(text: '${book.location.column},', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                 const SizedBox(height: 5),
                 RichText(
                        text: TextSpan(
                        style: TextStyle(
                              fontSize: 24.0,
                                color: Colors.red[700],
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Section:   '),
                          TextSpan(text: book.location.section + ',', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                    const SizedBox(height: 5),
                    RichText(
                        text: TextSpan(
                        style:  TextStyle(
                              fontSize: 24.0,
                                color: Colors.red[700],
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Row:   '),
                          TextSpan(text: '${book.location.row},', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                    ],
                  ),
                ),
              ],
            ), 
         ],
         );
  }
}
