import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final Widget icon;
  final Widget text;

  ButtonWithIcon({this.icon, this.text});

  @override
  Widget build(BuildContext context) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 24,
                width: 24,
                margin: EdgeInsets.only(right: 10),
                child: this.icon),
            Container(
              height: 24,
              alignment: Alignment.centerLeft,
              child: this.text,
            )
          ]);
}

class SubmitButton extends StatefulWidget {
  final String init;
  final String loading;
  final String success;
  final String failure;
  final dynamic onPressed;
  final bool showMsg;

  SubmitButton(
      {this.init = 'Aktualisieren',
      this.loading = 'Wird aktualisiert',
      this.success = 'Erfolgreich aktualisiert',
      this.failure = 'Fehlgeschlagen',
      this.onPressed,
      this.showMsg = false});

  _SubmitButtonState createState() => _SubmitButtonState(button: this);
}

class _SubmitButtonState extends State<SubmitButton> {
  SubmitButton button;
  _SubmitButtonState({this.button});

  Widget buttonContent;

  @override
  void initState() {
    buttonContent = Text(button.init);
    super.initState();
  }

  void _handleSubmit() {
    setState(() {
      buttonContent = FutureBuilder(
        future: button.onPressed(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return ButtonWithIcon(
                icon: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2,
                ),
                text: Text(button.loading));
          else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError || snapshot.data == false) {
              return ButtonWithIcon(
                  icon: Icon(Icons.error, color: Colors.white),
                  text: Text(button.showMsg
                      ? snapshot.error.toString()
                      : button.failure));
            } else
              return ButtonWithIcon(
                  icon: Icon(Icons.done, color: Colors.white),
                  text: Text(button.success));
          }
          return Text('Lädt');
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) =>
      ElevatedButton(onPressed: _handleSubmit, child: buttonContent);
}
