
import 'package:flutter/material.dart';

extension WidgetSize<T> on BuildContext{
  get getWidth => MediaQuery.of(this).size.width;
  get getHeight=> MediaQuery.of(this).size.height;
}