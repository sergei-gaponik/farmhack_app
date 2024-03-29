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
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController addressController;

  @override
  void initState() {
    _storage = FlutterSecureStorage();

    usernameController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future handleSubmit() async {
    Map body = {
      "username": usernameController.text,
      "password": passwordController.text,
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "address": addressController.text,
    };
    Map res = await Fetcher.fetch('post', 'api/account', body: body);
    print(res);
    if (res['status'] == 'success') {
      _storage.write(key: 'user', value: usernameController.text);
      _storage.write(key: 'hash', value: res['passwordHash']);
      Navigator.pushNamed(context, '/init');
    }
    return res;
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
              'Bitte gib deine Daten ein',
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
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Vorname'),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Nachname'),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Adresse'),
              )),
          SizedBox(
            height: 40,
            child: SubmitButton(
              onPressed: handleSubmit,
              showMsg: true,
              init: 'Jetzt registrieren',
              success: 'Erfolgreich gespeichert',
              loading: 'Wird überprüft',
              failure: 'Bitte überprüfe deine Eingaben',
            ),
          )
        ],
      ),
    ));
  }
}
