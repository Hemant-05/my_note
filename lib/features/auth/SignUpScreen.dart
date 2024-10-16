import 'package:flutter/material.dart';
import 'package:my_note/utils/Pallet/ColorPallet.dart';

import '../../utils/Custom/CusTextField.dart';
import '../../utils/Custom/Hgtbox.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _conPassController = TextEditingController();
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
            Text(
              'Sign up',
              style: TextStyle(
                  color: Cus_Pallet.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
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
            Hgtbox(h: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'home');
              },
              child: Text('Create an account'),
            ),
            Hgtbox(h: 30),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
              child: Text(
                'Already have an account !',
                style: TextStyle(color: Cus_Pallet.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
