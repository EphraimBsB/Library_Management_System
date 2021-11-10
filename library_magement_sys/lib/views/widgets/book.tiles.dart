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
                child: Image.network(
                  bookModel.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Title: ${bookModel.title}',
                maxLines: 2,
                style:
                const TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
               Text(
                'Author: ${bookModel.author}',
                maxLines: 2,
                style:
                const TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
               Text(
                'Status: ${bookModel.status}',
                maxLines: 2,
                style:
                const TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}