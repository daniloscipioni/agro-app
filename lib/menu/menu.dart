import 'package:bavaresco/repository/machineRepository.dart';
import 'package:bavaresco/screens/formulario/abastecer.dart';
import 'package:bavaresco/screens/formulario/apontar_defeito.dart';
import 'package:bavaresco/screens/formulario/atualizar_horimetro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

ScrollController scrollController;
bool dialVisible = true;

void setDialVisible(bool value) {
  //setState(() {
  dialVisible = value;
  // });
}

Widget buildBody() {
  return ListView.builder(
    controller: scrollController,
    itemCount: 30,
    itemBuilder: (ctx, i) => ListTile(title: Text('Item $i')),
  );
}


SpeedDial buildSpeedDial(BuildContext context, MachineRepository machine) {

  return SpeedDial(
    animatedIcon: AnimatedIcons.list_view,
    animatedIconTheme: IconThemeData(size: 22.0),
    // child: Icon(Icons.add),
    onOpen: () => print('OPENING DIAL'),
    onClose: () => print('DIAL CLOSED'),
    visible: dialVisible,
    curve: Curves.bounceIn,
    children: [

      // SpeedDialChild(
      //   child: Icon(Icons.filter_alt, color: Colors.white),
      //   backgroundColor: Colors.grey,
      //   onTap: () => print('THIRD CHILD'),
      //   // label:'Filtrar Histórico',
      //   // labelStyle: TextStyle(fontWeight: FontWeight.w500),
      //   // labelBackgroundColor: Colors.green,
      // ),
      SpeedDialChild(
        child: Icon(Icons.local_gas_station, color: Colors.white),
        backgroundColor: Colors.grey,
        onTap: () {

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FormularioAbastecer(machine: machine),
            ),
          );


          // ListaMaquinasCadastro(
          //   machine: machine,
          // ),
          // ),
          // );

        },
        // label: 'Abastecer',
        // labelStyle: TextStyle(fontWeight: FontWeight.w500),
        //labelBackgroundColor: Colors.green,
      ),
      // SpeedDialChild(
      //   child: Icon(Icons.access_time, color: Colors.white),
      //   backgroundColor: Colors.grey,
      //   onTap: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (context) => FormularioAtualizarHorimetro(machine: machine),
      //       ),
      //     );
      //   },
      //   // label: 'Atualizar Horímetro',
      //   // labelStyle: TextStyle(fontWeight: FontWeight.w500),
      //   //labelBackgroundColor: Colors.green,
      // ),
      SpeedDialChild(
        child: Icon(Icons.app_registration, color: Colors.white),
        backgroundColor: Colors.grey,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FormularioApontarDefeito(machine: machine),
            ),
          );
        },
        // label:'Registrar Defeito',
        // labelStyle: TextStyle(fontWeight: FontWeight.w500),
        //labelBackgroundColor: Colors.green,
      ),
    ],
  );

}