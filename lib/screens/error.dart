import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String title;
  final String message;
  final Widget body;

  ErrorScreen(
      {this.title = 'Irgendetwas ist schiefgelaufen',
      this.body,
      this.message = ''});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(24),
                  alignment: Alignment.center,
                  child: Icon(Icons.error, size: 60)),
              Container(
                  margin: EdgeInsets.all(24),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 20),
                      ),
                      if (message != '')
                        Container(
                          child: Text(
                            message,
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          margin: EdgeInsets.only(top: 12),
                        )
                    ],
                  )),
              Container(
                  margin: EdgeInsets.all(24),
                  alignment: Alignment.center,
                  child: body ?? Container())
            ],
          ),
        ),
      );
}
