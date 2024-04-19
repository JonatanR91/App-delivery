import 'package:flutter/material.dart';

// Extencion publica
double getScreenWidth({required BuildContext context, double? multiplier}) {
  var width = MediaQuery.of(context).size.width;
  if (multiplier != null) {
    width = width * multiplier;
  }
  return width;
}

double getScreenHeight({required BuildContext context, double? multiplier}) {
  var height = MediaQuery.of(context).size.height;
  if (multiplier != null) {
    height = height * multiplier;
  }
  return height;
}