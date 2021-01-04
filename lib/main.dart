import 'package:bavaresco/models/maquina/InfoMachine.dart';
import 'package:bavaresco/screens/lista/maquina.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bavaresco/database/machine_historico_dao.dart';

void main() {
  runApp(
    BavarescoApp(),
  );
}

class BavarescoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.greenAccent[700],
          textTheme: ButtonTextTheme.accent,
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(secondary: Colors.white), // Text color
        ),
      ),
      home: ListaMaquinas(),
    );
  }
}
