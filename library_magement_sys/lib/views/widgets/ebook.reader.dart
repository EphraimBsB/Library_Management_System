import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


/// Represents EbookReader for Navigation
class EbookReader extends StatefulWidget {
  @override
  _EbookReader createState() => _EbookReader();
}

class _EbookReader extends State<EbookReader> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  var data = Get.arguments;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var imgUrl = data[1];
    var bookTitle = data[0];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade300,
        leading: IconButton(onPressed: (){
          Get.back();
        }, 
        icon: const Icon(Icons.arrow_back)
        ),
        title:  Text('$bookTitle', style: const TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        'https://www.kindacode.com/wp-content/uploads/2021/07/test.pdf',
        key: _pdfViewerKey,
      ),
    );
  }
}
