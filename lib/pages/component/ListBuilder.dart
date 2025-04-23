
import 'package:flutter/material.dart';

class ListBuilder {

  static List<Widget> build({required double horizontal, required List<Widget> child}) {
    List<Widget> temp = [];
    for (var element in child) {
      temp.add(SizedBox(width: horizontal,));
      temp.add(element);
    }
    temp.add(SizedBox(width: horizontal,));
    return temp;
  }


}