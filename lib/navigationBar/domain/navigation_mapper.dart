import 'package:flutter/material.dart';

class NavigationMapper {
    final int index;
    final NavigationDestination navigationDestination;
    final Widget widget;
    NavigationMapper({required this.index, required this.navigationDestination, required this.widget});
}
    