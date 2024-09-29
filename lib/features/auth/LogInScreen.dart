import 'package:flutter/material.dart';
import 'package:my_note/custom/CusTextField.dart';
import 'package:my_note/custom/Hgtbox.dart';
import 'package:my_note/utils/Pallet/ColorPallet.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon/logo.png',
              scale: 2,
            ),
            Hgtbox(h: 50),
            CusTextField(
                controller: nameController,
                hintText: "Enter name",
                prefixIcon: Icon(Icons.person),
                isObscure: false),
            Hgtbox(h: 10),
            CusTextField(
                controller: passController,
                hintText: "Enter password",
                prefixIcon: Icon(Icons.key),
                isObscure: true),
            Hgtbox(h: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Log in"),
            ),
            Hgtbox(h: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'signup');
              },
              child: Text(
                'Don\'t have an account !',
                style: TextStyle(color: Cus_Pallet.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
