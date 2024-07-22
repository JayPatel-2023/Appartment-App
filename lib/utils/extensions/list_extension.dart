import 'package:flutter/material.dart';

extension SpacedList on List<Widget> {
  List<Widget> divide(double spacing) {
    List<Widget> spacedChildren = [];
    for (int i = 0; i < length; i++) {
      spacedChildren.add(this[i]);
      if (i != length - 1) {
        spacedChildren.add(SizedBox(width: spacing));
      }
    }
    return spacedChildren;
  }
}