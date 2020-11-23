import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:delayed_display/delayed_display.dart';

import '../home/home_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final Map checkoutResponse;
  CheckoutScreen({this.checkoutResponse});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Future goBack;

  @override
  void initState() {
    goBack = Future.delayed(Duration(milliseconds: 3500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: FutureBuilder(
          future: goBack,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircularPercentIndicator(
                      radius: 100,
                      lineWidth: 10,
                      percent: 1,
                      progressColor: Colors.green[800],
                      animation: true,
                      animationDuration: 3000,
                      curve: Curves.easeOutExpo,
                      startAngle: 0,
                      center: DelayedDisplay(
                        delay: Duration(milliseconds: 1000),
                        slidingBeginOffset: Offset(0.0, 0.0),
                        child: Icon(
                          Icons.done,
                          size: 60,
                          color: Colors.green[800],
                        ),
                      ),
                    ),
                    Center(
                        child: DelayedDisplay(
                            delay: Duration(milliseconds: 1000),
                            slidingBeginOffset: Offset(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.all(36.0),
                              child: Text(
                                'Bestellung erfolgreich verarbeitet!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.green[800],
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ))),
                  ],
                );
              case ConnectionState.done:
                return HomeScreen();
            }
          }));
}
