import 'package:flutter/material.dart';

class TabsModel {
  final String iconpath;
  final String label;
  final String backgroudImage;
  final Widget content;

  TabsModel({
    required this.iconpath,
    required this.label,
    required this.backgroudImage,
    required this.content, 
  });
}