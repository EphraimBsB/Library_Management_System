import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/controllers/books/book.controller.dart';
import 'package:library_magement_sys/models/book.model/book.model.dart';

class BookTile extends StatelessWidget {

  final Book bookModel;
  final BookController bookController = Get.put(BookController());
  BookTile(this.bookModel);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Get.toNamed("/books/book/${bookModel.id}");
        bookController.findOneBook();
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child:bookModel.image.contains('uploaded_files')?Image.network(
                  'http://192.168.56.1:5000/${bookModel.image}',
                  fit: BoxFit.cover,
                ):Image.network(
                  bookModel.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                   bookModel.title,
                   maxLines: 2,
                   overflow: TextOverflow.ellipsis,
                   style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                  style: const TextStyle(
                        // fontSize: 18.0,
                        color: Colors.black,
                      ),
                  children: <TextSpan>[
                    const TextSpan(text: 'by: '),
                    TextSpan(text: bookModel.author, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )),
              const SizedBox(height: 8),
              Text(
                '${bookModel.status}(${bookModel.stock})',
                 style: const TextStyle(fontWeight: FontWeight.bold)
              ),
            ],
          ),
        ),
      ),
    );
  }
}