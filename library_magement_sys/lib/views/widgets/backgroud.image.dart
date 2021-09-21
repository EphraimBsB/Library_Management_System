import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/libraryW.jpg'),
                  fit: BoxFit.contain,
                )),
    );
  }
}