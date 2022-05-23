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
                      child: book.image.contains('uploaded_files')?Image.network(
                  'http://192.168.56.1:5000/${book.image}',
                  fit: BoxFit.cover,
                ):Image.network(
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
                  width: 420,
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
                            const TextSpan(text: 'Access No: '),
                            TextSpan(text: book.acc_num, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                      const SizedBox(height: 5,),
                      RichText(
                        maxLines: 2,
                        text:  TextSpan(
                        style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                        children: <TextSpan>[
                           const TextSpan(text: 'Ebook:   '),
                          book.ebook == null?const TextSpan(text: 'Not Available', style: TextStyle(fontWeight: FontWeight.bold)):const TextSpan(text: 'Available', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                      const SizedBox(height: 5,),
                    ],
                  ),
                ),
                Container(
                  width: 350,
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
                          TextSpan(text: book.shelf+',', style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          TextSpan(text: book.side+',', style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          TextSpan(text: '${book.column},', style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          TextSpan(text: book.subjects + ',', style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          TextSpan(text: '${book.row},', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                    ],
                  ),
                ),
                 Container(
                  width: 200,
                  child: Column(
                    children: [
                      book.ebook == null?Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                      color:  Colors.blue.shade100,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                      child:const Text('Read',
                      style: TextStyle(
                      color: Colors.white,
                      ),),
                    ):TextButton(
                      onPressed: (){
                        Get.toNamed("/book/read_ebook", arguments: [book.title, book.ebook]);
                      }, 
                      child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color:  Color.fromRGBO(5, 38, 154, 5),
                      borderRadius:  BorderRadius.all(Radius.circular(5)),
                        ),
                      child:const Text('Read',
                      style: TextStyle(
                      color: Colors.white,
                      ),),
                    )
                  ),
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
              const SizedBox(height: 70,),
            ],
              ),
            )
              ],
            ), 
         ],
         );
  }
}
