import 'package:flutter/material.dart';

class SizeConfig {
  static double? width;
  static double? height;
  static double? size;
  static Orientation? orientation;
  void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;

    size =
        orientation == Orientation.landscape ? height! * .024 : width! * .024;

    //print('this is the default size $size');
  }
}
/*

Import in:
first widget build
SizeConfig().init(context); 


*/