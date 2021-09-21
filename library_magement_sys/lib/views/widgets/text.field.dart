import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  final String label;
  final  TextEditingController controller;
  
  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  SizedBox(
                   width: 0.4*width,
                   height: 40,
                   child:  TextField(
                     controller: controller,
                     decoration: InputDecoration(
                       label: Text(label),
                       border: const OutlineInputBorder()
                     ),
                   ),
                 );
  }
}
