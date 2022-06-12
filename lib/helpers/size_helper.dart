import 'package:flutter/material.dart';

class SizeHelper {
  SizeHelper._();

  static final SizeHelper _instance = SizeHelper._();

  static SizeHelper get instance => _instance;

  MediaQueryData? _mediaQueryData;
  BuildContext? _context;

  double? blockSizeHorizontal;
  double? blockSizeVertical;
  double? safeBlockHorizontal;
  double? safeBlockVertical;
  double? screenHeight;
  double? screenWidth;

  double? _safeAreaHorizontal;
  double? _safeAreaVertical;

  set context(BuildContext context) {
    _context = context;
    _setUp();
  }

  _setUp() {
    _mediaQueryData = MediaQuery.of(_context!);
    screenWidth = _mediaQueryData?.size.width ?? 0;
    screenHeight = _mediaQueryData?.size.height ?? 0;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;
  }
}
