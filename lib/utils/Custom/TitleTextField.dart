import 'package:flutter/material.dart';
import 'package:my_note/utils/Pallet/ColorPallet.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({super.key, required this.titleController});
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Cus_Pallet.black),
      decoration: InputDecoration(
        hintText: 'Enter Title',
        hintStyle: TextStyle(color: Cus_Pallet.grey),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
