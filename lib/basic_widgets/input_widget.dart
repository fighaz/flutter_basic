import 'package:flutter/material.dart';

class MyInputWidget extends StatelessWidget {
  const MyInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Nama',
        ));
  }
}
