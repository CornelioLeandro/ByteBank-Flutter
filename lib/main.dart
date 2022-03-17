import 'dart:ffi';
import 'package:bytebank/ui/screens_contact/contact_form.dart';
import 'package:bytebank/ui/screens_contact/contacts.dart';
import 'package:bytebank/ui/screens_contact/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.green,
        ),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}