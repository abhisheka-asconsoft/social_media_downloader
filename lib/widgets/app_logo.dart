import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_constants.dart';
import '../helpers/size_helper.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;
  const AppLogo({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? SizeHelper.instance.safeBlockHorizontal! * 15,
      height: height ?? SizeHelper.instance.safeBlockVertical! * 15,
      child: SvgPicture.asset(
        AppConstants.images.appLogo,
      ),
    );
  }
}