import 'package:flutter/material.dart';
import 'package:my_note/custom/CusTextField.dart';
import 'package:my_note/custom/Hgtbox.dart';
import 'package:my_note/utils/Pallet/ColorPallet.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _conPassController = TextEditingController();
  bool isObs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon/logo.png',
              scale: 2,
            ),
            Hgtbox(h: 50),
            CusTextField(
                controller: _nameController,
                hintText: 'Name',
                prefixIcon: Icon(
                  Icons.person,
                ),
                isObscure: false),
            Hgtbox(h: 10),
            CusTextField(
                controller: _emailController,
                hintText: 'Email',
                prefixIcon: Icon(Icons.mail),
                isObscure: false),
            Hgtbox(h: 10),
            CusTextField(
                controller: _passController,
                hintText: 'Password',
                prefixIcon: Icon(Icons.key),
                isObscure: true),
            Hgtbox(h: 10),
            CusTextField(
                controller: _conPassController,
                hintText: 'Confirm Password',
                prefixIcon: Icon(Icons.key),
                isObscure: true),
            Hgtbox(h: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
              child: Text(
                'Already have an account !',
                style: TextStyle(color: Cus_Pallet.blue),
              ),
            ),
            Hgtbox(h: 10),
            ElevatedButton(onPressed: (){}, child: Text('Create an account'),),
          ],
        ),
      ),
    );
  }
}
