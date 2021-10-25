// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/constants/button.dart';
import 'package:library_magement_sys/controllers/books/book.management.controller.dart';
import 'package:library_magement_sys/models/book.model/book.model.dart';
import 'package:library_magement_sys/utils/responsive.screen.dart';
import 'package:library_magement_sys/constants/app.bar.dart';
import 'package:library_magement_sys/views/widgets/book.tiles.dart';

class HomePage extends StatefulWidget {
   HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final BookManagementController? bookControllerManag = Get.put(BookManagementController());
    var filterBooks = <Book>[].obs;
    TextEditingController searchTextController = TextEditingController();
    bool searchButtonState = true;
    bool firstButtonState = false;
    bool secondButtonState = false;
    bool thirdButtonState = false;
    bool fourthButtonState = false;
    bool fithButtonState = false;
    bool sixthButtonState = false;
    
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppBarwidget(),
              Container(height: height*0.1,),
              const Text(
                'Find a Book',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              
              const  SizedBox(
                  height: 20,
                ),
             Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   SizedBox(
                     width: 0.4*width,
                     height: 40,
                     child:  TextField(
                       controller: searchTextController,
                       decoration: const InputDecoration(
                         hintText: "search book title, author.............................................",
                         hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 14
                            ),
                         border: OutlineInputBorder()
                       ),
                       onSubmitted: (text) {
                         if(text.isEmpty) {
                          Get.snackbar("", "Wrong Input",snackPosition: SnackPosition.TOP);
                        }else {
                          Get.toNamed("/search", arguments: text);
                        }
                        },
                     ),
                   ),
                   ButtonWidget('Search', searchButtonState, searchButtonFunct),
        
                  ],
                ),

                const  SizedBox(
                  height: 10,
                ),
              const Text(
                'Today a reader, Tomorrow a leader',
                style: TextStyle(
                  // fontStyle: FontStyle.italic,
                  fontSize: 18
                ),
              ),
              const  SizedBox(
                  height: 5,
                ),
              Container(
                width: 750,
                child: const Text(
                  'library_management_system - find a book by title or by author, borrow a book, find book location in the library. Everything you need for better future and success has already been writen.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                      fontSize: 15
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

                const  SizedBox(
                  height: 50,
                ),
                  Row(
                    children: [
                       Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: TextButton(
                          onPressed: (){
                            filterBooks.clear();
                            setState(() {
                            firstButtonState = false;
                            secondButtonState = false;
                            thirdButtonState = false;
                            fourthButtonState = false;
                            fithButtonState = false;
                            sixthButtonState = false;
                            });
                            
                          },
                          child: const Text(
                          'All Books',
                          style: TextStyle(
                          fontSize: 30,
                          color: Colors.black
                         ),
                        ),
                        ),
                      ),
                ),
                const SizedBox(width: 20,),
                 ButtonWidget('Business', firstButtonState, firstButtonFunct),
                 ButtonWidget('Computer', secondButtonState, secondButtonFunct),
                 ButtonWidget('Engineering', thirdButtonState, thirdButtonFunct),
                 ButtonWidget('General', fourthButtonState, fourthButtonFunct),
                 ButtonWidget('Indians', fithButtonState, fithButtonFunct),
                 ButtonWidget('Projects', sixthButtonState, sixthButtonFunct),
                 
                ],
              ),
                       const  SizedBox(
                  height: 20,
                ),
                 Obx(() {
                  if(bookControllerManag!.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return filterBooks.isNotEmpty ? StaggeredGridView.countBuilder(
                   shrinkWrap: true,
                   crossAxisCount: ResponsiveSizedScreen.isLargeScreen(context)?6:4,
                   itemCount: filterBooks.length,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 10,
                   itemBuilder: (context, index){
                     return BookTile(filterBooks[index]);
                   }, 
                   staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                   ):StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                   crossAxisCount: ResponsiveSizedScreen.isLargeScreen(context)?6:4,
                   itemCount: bookControllerManag!.allbookslist.length,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 10,
                   itemBuilder: (context, index){
                     return BookTile(bookControllerManag!.allbookslist[index]);
                   }, 
                   staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                   );
                } ),
                
              ],
          ),
        ),
      ),
    );
  }
  searchButtonFunct(){
    String searchText = searchTextController.text;
    if(searchText.isEmpty) {
     Get.snackbar("Error", "Wrong Input",snackPosition: SnackPosition.TOP);
    }else {
    Get.toNamed("/search", arguments: searchText);
    }
  }

   firstButtonFunct(){
                        filterBooks.clear();
                        bookControllerManag!.allbookslist.forEach((book) =>{
                          if(book.category.contains('Business')){
                            filterBooks.add(book)
                          }
                        });
                        setState((){
                        firstButtonState = true;
                        secondButtonState = false;
                        thirdButtonState = false;
                        fourthButtonState = false;
                        fithButtonState = false;
                        sixthButtonState = false;
                      });
                    }
    secondButtonFunct(){
                        filterBooks.clear();
                        bookControllerManag!.allbookslist.forEach((book) =>{
                          if(book.category.contains('Computer')){
                            filterBooks.add(book)
                          }
                        });
                        setState((){
                        firstButtonState = false;
                        secondButtonState = true;
                        thirdButtonState = false;
                        fourthButtonState = false;
                        fithButtonState = false;
                        sixthButtonState = false;
                      });
                    }
    thirdButtonFunct(){
                        filterBooks.clear();
                        bookControllerManag!.allbookslist.forEach((book) =>{
                          if(book.category.contains('Engineering')){
                            filterBooks.add(book)
                          }
                        });
                        setState((){
                        firstButtonState = false;
                        secondButtonState = false;
                        thirdButtonState = true;
                        fourthButtonState = false;
                        fithButtonState = false;
                        sixthButtonState = false;
                      });
                    }
    fourthButtonFunct(){
                        filterBooks.clear();
                        bookControllerManag!.allbookslist.forEach((book) =>{
                          if(book.category.contains('General')){
                            filterBooks.add(book)
                          }
                        });
                        setState((){
                        firstButtonState = false;
                        secondButtonState = false;
                        thirdButtonState = false;
                        fourthButtonState = true;
                        fithButtonState = false;
                        sixthButtonState = false;
                      });
                    }
    fithButtonFunct(){
                        filterBooks.clear();
                        bookControllerManag!.allbookslist.forEach((book) =>{
                          if(book.category.contains('Indian')){
                            filterBooks.add(book)
                          }
                        });
                        setState((){
                        firstButtonState = false;
                        secondButtonState = false;
                        thirdButtonState = false;
                        fourthButtonState = false;
                        fithButtonState = true;
                        sixthButtonState = false;
                      });
                    }
    sixthButtonFunct(){
                        filterBooks.clear();
                        bookControllerManag!.allbookslist.forEach((book) =>{
                          if(book.category.contains('Projects')){
                            filterBooks.add(book)
                          }
                        });
                        setState((){
                        firstButtonState = false;
                        secondButtonState = false;
                        thirdButtonState = false;
                        fourthButtonState = false;
                        fithButtonState = false;
                        sixthButtonState = true;
                        });
                    }
}