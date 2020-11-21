import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {

  final String title;

  LoadingScreen({this.title});

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: CircularProgressIndicator()
      ),
      Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text(title, style: TextStyle(fontSize: 20),)
      )
    ],
  );
}