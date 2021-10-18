import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String label = '';
  bool buttonState = false;
  var funct;
  // var width;
  ButtonWidget(
    this.label,
    this.buttonState,
    this.funct,
  );

  @override
  Widget build(BuildContext context) {
    return TextButton(
              onPressed: funct, 
              child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 40,
              decoration: BoxDecoration(
              color: buttonState ? const Color.fromRGBO(5, 38, 154, 5) : Colors.grey[350],
              borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
              child: Text(label,
              style: TextStyle(
                     color: buttonState ? Colors.white : Colors.black,
                  ),),
            )
          );
  }
}
