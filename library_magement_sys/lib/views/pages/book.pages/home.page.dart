import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/controllers/books/book.controller.dart';
import 'package:library_magement_sys/controllers/loans/loan.controller.dart';
import 'package:library_magement_sys/utils/responsive.screen.dart';
import 'package:library_magement_sys/views/widgets/app.bar.dart';
import 'package:library_magement_sys/views/widgets/book.tiles.dart';

class HomePage extends StatefulWidget {
   HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    BookController? bookController;
    TextEditingController searchTextController = TextEditingController();
    LoanController loanController = Get.put(LoanController());
    
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBarwidget(),
            Container(height: height*0.3,),
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
                   ),
                 ),
                 
                 TextButton(
                    onPressed: (){
                      String searchText = searchTextController.text;
                      if(searchText.isEmpty) {
                        Get.snackbar("Error", "Please input a wright word",snackPosition: SnackPosition.TOP);
                      }else {
                        bookController = Get.put(BookController());
                        bookController!.bookSearch(searchText);
                      }
                       setState(() {
                         bookController;
                       });
                    }, 
                    child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(5, 38, 154, 5),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Text('Search',
                    style: TextStyle(
                            color: Colors.white
                          ),),
                    )
                 ),
      
                ],
              ),
       
            const  SizedBox(
                height: 20,
              ),
              if(bookController != null) 
               Obx(() {
                if(bookController!.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                 crossAxisCount: ResponsiveSizedScreen.isLargeScreen(context)?6:4,
                 itemCount: bookController!.bookslist.length,
                 crossAxisSpacing: 16,
                 mainAxisSpacing: 16,
                 itemBuilder: (context, index){
                   return BookTile(bookController!.bookslist[index]);
                 }, 
                 staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                 );
              } )
             
          ],
        ),
      ),
    );
  }
}