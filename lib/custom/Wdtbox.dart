import 'package:flutter/material.dart';

class Wdtbox extends StatelessWidget {
  const Wdtbox({super.key, required this.w});
  final double w;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: w,);
  }
}
