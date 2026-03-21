import 'package:flutter/cupertino.dart';

class Dimensions {
  static final _mediaQuery = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first);
  static double deviceHeightPercentage(){
    return _mediaQuery.size.height/1000;
  }
  static double deviceWidthPercentage(){
    return _mediaQuery.size.width/500;
  }
  static double deviceShortestSidePercentage(){
    return _mediaQuery.size.shortestSide/500;
  }
}