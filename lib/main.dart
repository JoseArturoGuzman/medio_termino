import 'package:flutter/material.dart';
import 'package:medio_termino/views/begining_page.dart';

void main() => runApp(Questions());

class Questions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: begining()
    );
  }
}
