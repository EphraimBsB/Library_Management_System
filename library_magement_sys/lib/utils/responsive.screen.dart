import 'package:flutter/cupertino.dart';

class ResponsiveSizedScreen extends StatelessWidget {
   final Widget largeScreen;
  final Widget smallScreen;
  final Widget mediumScreen;
  const ResponsiveSizedScreen({
    Key? key,
    required this.largeScreen,
    required this.smallScreen,
    required this.mediumScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context){
    return MediaQuery.of(context).size.width<800;
  }

  static bool isMediumScreen(BuildContext context){
    return MediaQuery.of(context).size.width>=800 && MediaQuery.of(context).size.width<=1200;
  }

  static bool isLargeScreen(BuildContext context){
    return MediaQuery.of(context).size.width>1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains){
        if(constrains.maxWidth>1200){
          return largeScreen;
        }else if(constrains.maxWidth<=1200 && constrains.maxWidth>=800){
          return mediumScreen;
        }else{
          return smallScreen;
        }
      },
    );
  }
}
