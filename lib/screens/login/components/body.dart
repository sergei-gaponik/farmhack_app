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
    Map res = await Fetcher.fetch('post', 'api/login', body: body);
    if (res['status'] == 'success') {
      await _storage.write(key: 'user', value: usernameController.text);
      await _storage.write(key: 'hash', value: res['passwordHash']);
      Navigator.pushNamed(context, '/init');
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              margin: EdgeInsets.only(bottom: 12),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'E-Mail Adresse'),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 12),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Passwort'),
              )),
          Container(
            margin: EdgeInsets.only(bottom: 18),
            child: SizedBox(
              height: 40,
              child: SubmitButton(
                onPressed: handleSubmit,
                init: 'Anmelden',
                success: 'Erfolgreich angemeldet',
                loading: 'Wird überprüft',
                failure: 'Falsche Login-Daten',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 18),
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                  child: Text('Registrieren'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  }),
            ),
          )
        ],
      ),
    ));
  }
}
