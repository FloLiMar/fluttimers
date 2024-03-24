import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/constants.dart' as constants;

Widget getMaxWidthMobileBuilder(BoxConstraints constraints, Widget widget) {
  if (constraints.maxWidth >= 480) {
    return buildSizedBox(width: constraints.maxWidth * 0.5, widget: widget);
  } else {
    return buildSizedBox(
        width: constraints.maxWidth,
        horizontalPadding: constants.smallSpace,
        widget: widget);
  }
}

Widget buildSizedBox(
    {required double width,
    required Widget widget,
    double horizontalPadding = 0}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
    child: SizedBox(
      width: width,
      child: widget,
    ),
  );
}

Widget getSvgWidget(String svgName, double height) {
  return SvgPicture.asset('assets/svg/$svgName.svg',
      semanticsLabel: svgName, fit: BoxFit.scaleDown, height: height,);
}
