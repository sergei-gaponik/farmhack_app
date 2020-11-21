import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String title;
  final Map loader;

  LoadingScreen({this.title = "", this.loader});

  @override
  Widget build(BuildContext context) {
    print(this.loader);
    return this.loader != null
        ? Scaffold(
            body: new Stack(
            children: [
              Container(
                decoration: new BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(loader['imageURL']),
                  fit: BoxFit.cover,
                )),
              ),
              Center(
                child: Text(this.title),
              )
            ],
          ))
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()),
              Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          );
  }
}
