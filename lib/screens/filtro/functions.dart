import 'package:flutter/material.dart';

import 'formulario.dart';

Future<void> FiltroMaquina(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Selecione um modelo'),
          children: <Widget>[
            FormularioFiltroMaquina(),
          ],
        );
      });
}