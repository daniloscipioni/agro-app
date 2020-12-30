import 'package:bavaresco/database/machine_dao.dart';
import 'package:bavaresco/menu/menu.dart';
import 'package:bavaresco/repository/machineRepository.dart';
import 'package:bavaresco/screens/filtro/formulario.dart';
import 'package:bavaresco/screens/filtro/functions.dart';
import 'package:bavaresco/screens/lista/historico.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../menu.dart';

class ListaMaquinas extends StatelessWidget {
  final MachineDao _dao = MachineDao();
  final String _title = "Máquinas";
  final String _updating = "Sincronizando Banco de Dados!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuHamburger(),
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.sync),
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text(_updating),
                );

                // Find the Scaffold in the widget tree and use
                // it to show a SnackBar.
                Scaffold.of(context).showSnackBar(snackBar);
              },
            );
          })
        ],
      ),
      body: _machinesList(),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     Icons.filter_alt_outlined,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {
      //     //Abre show dialog para filtro
      //     FiltroMaquina(context);
      //   },
      // ),
    );
  }
}

class _machinesList extends StatelessWidget {
  final MachineDao _dao = MachineDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<MachineRepository>>(
        initialData: List(),
        //Traz as máquinas do banco local
        future: _dao.findAllMachines(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<MachineRepository> machines = snapshot.data;

              return
                  // Scaffold(
                  //   body: ListView(
                  //     children: [
                  //       ExpansionTile(
                  //         title: Text('List-A'),
                  //         children: [Text('test')],
                  //       ),
                  //       ExpansionTile(
                  //         title: Text('List-A'),
                  //         children: [Text('test')],
                  //       )
                  //     ],
                  //   ),
                  // );
                  ListView.builder(
                itemBuilder: (context, index) {
                  final MachineRepository machine = machines[index];
                  return _machineItem(machine);
                },
                itemCount: machines.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
    );
  }
}

class _machineItem extends StatelessWidget {
  final MachineRepository machine;

  _machineItem(this.machine);

  @override
  Widget build(BuildContext context) {
    return
     // InkWell(
        // onTap: () {
        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (context) => ListaHistoricoMaquina(
        //         machine: machine,
        //       ),
        //     ),
        //   );
        // },
        // onTap: () {
        //   print("Card Clicked" + machine.id.toString());
        //
        // },
       // child:
       Container(
          decoration: new BoxDecoration(
              //color: Colors.green,
              // borderRadius: new BorderRadius.only(
              //   topLeft: const Radius.circular(40.0),
              //   topRight: const Radius.circular(40.0),
              // )
              ),
          child: ExpansionTile(
            title: Text(
              machine.mainTitle(),
              //maxLines: 5,
              // style: const TextStyle(
              //     //fontWeight: FontWeight.bold,
              //     color: Colors.black,
              //     fontSize: 18),
            ),

            //subtitle: Text(machine.machineManufacturer),
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                color: Colors.green[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.zero,topRight: Radius.zero, bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                  side: BorderSide(
                    color: Colors.green[300],
                    width: 1.0,
                  ),
                ),
                child: Container(
                  //padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: SizedBox(
                    // height: 210,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                    visualDensity: VisualDensity(
                                        horizontal: 0, vertical: -4),
                                    // contentPadding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                                    leading: Icon(Icons.local_gas_station),
                                    title: Text('Último Abastecimento'),
                                    subtitle: Text('305.65 Lts'),
                                    //trailing: Text('305.65 Lts'),
                                    isThreeLine: false),
                                ListTile(
                                  visualDensity:
                                      VisualDensity(horizontal: 0, vertical: -4),
                                  //contentPadding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                                  leading: Icon(Icons.access_time),
                                  title: Text('Horímetro '),
                                  subtitle: Text('4.500h'),
                                  //trailing: Text('4.500h'),
                                  isThreeLine: false,
                                ),
                                ListTile(
                                  visualDensity:
                                      VisualDensity(horizontal: 0, vertical: -4),
                                  //contentPadding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                                  leading: Icon(Icons.agriculture),
                                  title: Text('Consumo Médio'),
                                  subtitle: Text('5,6 L/h'),
                                  //trailing: Text('5,6 L/h'),
                                  isThreeLine: false,
                                ),
                                ListTile(
                                  visualDensity:
                                      VisualDensity(horizontal: 0, vertical: -4),
                                  //contentPadding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                                  leading: Icon(
                                    Icons.monetization_on,
                                  ),
                                  title: Text('Custo Horário'),
                                  subtitle: Text('R\$\ 150,00 /h'),
                                  //trailing: Text('R\$\ 150,00 /h'),
                                  isThreeLine: false,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                  //textDirection: ,
                                  children: [
                                    TextButton(

                                      child: Text('Ver Apontamentos'),
                                      onPressed: () {   Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ListaHistoricoMaquina(
                                            machine: machine,
                                          ),
                                        ),
                                      );},
                                    ),
                                  ],
                                ),
                               // const SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ),
            ],
          ),
        )//,
    //  )
    ;
  }
}
