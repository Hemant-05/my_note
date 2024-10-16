import 'package:flutter/material.dart';
import 'package:my_note/utils/Pallet/ColorPallet.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({
    super.key,
    required this.descriptionController,
  });

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: descriptionController,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Cus_Pallet.black),
        maxLines: 99,
        decoration: InputDecoration(
          hintText: 'Enter Description',
          hintStyle: TextStyle(color: Cus_Pallet.grey),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
