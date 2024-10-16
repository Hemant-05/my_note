import 'package:flutter/material.dart';
import 'package:my_note/utils/Pallet/ColorPallet.dart';

class CusTextField extends StatelessWidget {
  const CusTextField(
      {super.key, required this.controller, required this.hintText, required this.prefixIcon, required this.isObscure});

  final TextEditingController controller;
  final String hintText;
  final Icon prefixIcon;
  final bool isObscure;

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        10,
      ),
      borderSide: BorderSide(
          width: 15,
          color: Cus_Pallet.black
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        label: Text(hintText, style: TextStyle(color: Colors.blue),),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Cus_Pallet.blue,
                width: 2),
          ),
          border: border(),
      ),
    );
  }
}
