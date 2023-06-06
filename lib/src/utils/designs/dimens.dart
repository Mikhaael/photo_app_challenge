import 'package:flutter/material.dart';

vSpace(double vSpace) => SizedBox(
  height: vSpace,
);

hSpace(double hSpace) => SizedBox(
  width: hSpace,
);

bSpace({required double vSpace, required double hSpace}) => SizedBox(
  width: hSpace,
  height: vSpace,
);