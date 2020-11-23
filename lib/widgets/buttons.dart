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
  _SubmitButtonState({this.button, this.style});

  Widget _buttonContent;
  ButtonStyle style;

  @override
  void initState() {
    _buttonContent = Text(button.init);
    super.initState();
  }

  void _handleSubmit() {
    setState(() {
      _buttonContent = FutureBuilder(
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
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: _handleSubmit,
        child: _buttonContent,
        style: style ?? null,
      );
}

class StretchedButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  StretchedButton({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) => Container(
        height: 96,
        margin: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicWidth(
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  child: this.child,
                  onPressed: this.onPressed,
                ),
              ),
            )
          ],
        ),
      );
}
