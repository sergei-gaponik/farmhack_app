import 'package:flutter/material.dart';
import 'components/body.dart';
import '../../util/fetch.dart';
import '../loading/loading.dart';
import '../init/init_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  Future loggedIn;

  @override
  void initState() {
    loggedIn = Fetcher.loggedIn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<bool>(
            future: loggedIn,
            builder: (context, snapshot) {
              print('moin');
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return LoadingScreen(logo: true);
                case ConnectionState.active:
                  return LoadingScreen(logo: true);
                case ConnectionState.waiting:
                  return LoadingScreen(logo: true);
                case ConnectionState.done:
                  if (snapshot.data)
                    return InitScreen();
                  else
                    return Body();
              }
              return LoadingScreen(logo: true);
            }));
  }
}
