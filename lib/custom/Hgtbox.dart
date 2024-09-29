import 'package:flutter/material.dart';

class Hgtbox extends StatelessWidget {
  const Hgtbox({super.key, required this.h});
  final double h;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: h,);
  }
}
