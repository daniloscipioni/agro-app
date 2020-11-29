import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class FormularioFiltroMaquina extends StatefulWidget {
  FormularioFiltroMaquina({Key key}) : super(key: key);

  @override
  _FormularioFiltroMaquinaState createState() =>
      _FormularioFiltroMaquinaState();


}

/// This is the private State class that goes with MyStatefulWidget.
class _FormularioFiltroMaquinaState extends State<FormularioFiltroMaquina> {
  String dropdownValue = 'Categoria';
  String dropdownValueModelo = 'Fabricante';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            itemHeight: 60,
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.green),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Categoria', 'Trator','Colheitadeira','Plantadeira','Pulverizador','Implemento']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          DropdownButton<String>(
            value: dropdownValueModelo,
            icon: Icon(Icons.arrow_downward),
            itemHeight: 60,
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.green),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String newValue1) {
              setState(() {
                dropdownValueModelo = newValue1;
              });
            },
            items: <String>['Fabricante', 'Valtra', 'John Deere', 'Massey Fergunson', 'Case', 'New Holland', 'Fendt', 'Stara']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          RaisedButton(
            child: Text(
              'Filtrar',
            ),
            onPressed: () {
              print('botao filtrar');
                   },
          ),
        ],
      ),
    );
  }
}
