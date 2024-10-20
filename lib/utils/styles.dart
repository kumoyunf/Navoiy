import 'package:flutter/material.dart';

smallTextStyle({Color color = const Color(0xffffffff)})=>TextStyle(
    fontSize: 16,
    color: color,
    fontWeight: FontWeight.w600
);

mediumTextStyle({Color color = const Color(0xffffffff)})=>TextStyle(
  fontSize: 20,
  color: color,
  fontWeight: FontWeight.w600
);

largeTextStyle({Color color = const Color(0xffffffff)})=>TextStyle(
    fontSize: 24,
    color: color,
    fontWeight: FontWeight.w700
);

extraLargeTextStyle({Color color = const Color(0xffffffff)})=>TextStyle(
    fontSize: 32,
    color: color,
    fontWeight: FontWeight.w600
);