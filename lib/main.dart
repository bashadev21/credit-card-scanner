import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_card_io/flutter_card_io.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> scan() async {
    var details = await FlutterCardIo.scanCard({
      "requireExpiry": true,
      "scanExpiry": true,
      "requireCVV": true,
      "requirePostalCode": false,
      "restrictPostalCodeToNumericOnly": true,
      "requireCardHolderName": true,
      "scanInstructions": "Hola! Fit the card within the box",
    });
    print('Response' + details.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('card_scanner app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  scan();
                },
                child: Text('scan card'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
