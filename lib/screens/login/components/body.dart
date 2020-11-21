import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../util/fetch.dart';
import '../../../widgets/buttons.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BodyState();
}

class BodyState extends State<Body> {
  FlutterSecureStorage _storage;

  TextEditingController usernameController;
  TextEditingController passwordController;

  @override
  void initState() {
    _storage = FlutterSecureStorage();

    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future handleSubmit() async {
    Map body = {
      "username": usernameController.text,
      "password": passwordController.text,
    };
    print(body);
    Map res = await Fetcher.fetch('post', 'api/login', body: body);
    print(res);
    if (res['status'] == 'success') {
      _storage.write(key: 'user', value: usernameController.text);
      _storage.write(key: 'hash', value: res['passwordHash']);
      Navigator.pushNamed(context, '/home');
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              'Willkommen bei bauer-nebenan.de',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'E-Mail Adresse'),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Passwort'),
              )),
          SizedBox(
            height: 40,
            child: SubmitButton(
              onPressed: handleSubmit,
              init: 'Speichern',
              success: 'Erfolgreich gespeichert',
              loading: 'Wird überprüft',
              failure: 'Falsche Login-Daten',
            ),
          ),
          SizedBox(
            height: 40,
            child: SubmitButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              init: 'Speichern',
              success: 'Erfolgreich gespeichert',
              loading: 'Wird überprüft',
              failure: 'Falsche Login-Daten',
            ),
          )
        ],
      ),
    ));
  }
}
