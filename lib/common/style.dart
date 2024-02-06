import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget getMaxWidthMobileBuilder(BoxConstraints constraints, Widget widget) {
  if (constraints.maxWidth >= 480) {
    return buildSizedBox(
      width: constraints.maxWidth * 0.5,
        widget: widget
    );
  } else {
    return buildSizedBox(
      width: constraints.maxWidth,
      horizontalPadding: 20,
      widget: widget
    );
  }
}

Widget buildSizedBox({required double width, required Widget widget, double horizontalPadding = 0}) {
  return Padding(padding: EdgeInsets.symmetric(horizontal: horizontalPadding), child: SizedBox(width: width, child: widget,),);
}