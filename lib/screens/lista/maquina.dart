import 'package:bavaresco/database/machine_dao.dart';
import 'package:bavaresco/menu/menu.dart';
import 'package:bavaresco/repository/machineRepository.dart';
import 'package:bavaresco/screens/filtro/formulario.dart';
import 'package:bavaresco/screens/filtro/functions.dart';
import 'package:bavaresco/screens/lista/historico.dart';
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

              return ListView.builder(
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ListaHistoricoMaquina(
              machine: machine,
            ),
          ),
        );
      },
      // onTap: () {
      //   print("Card Clicked" + machine.id.toString());
      //
      // },
      child: Card(

        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          //borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: Colors.black,
            width: 0.2,
          )
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
                    // padding: const EdgeInsets.fromLTRB(5.0, 0.0, 2.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ColoredBox(
                                color: Colors.green,

                                //height: 50,
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Text(
                                      machine.mainTitle(),
                                      maxLines: 10,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        fontSize: 20
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              ListTile(
                                 visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                 // contentPadding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                                  leading: Icon(Icons.local_gas_station),
                                  title: Text('Último Abastecimento'),
                                  subtitle: Text('305.65 Lts'),
                                  //trailing: Text('305.65 Lts'),
                                  isThreeLine: false),
                              ListTile(
                                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                //contentPadding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                                leading: Icon(Icons.access_time),
                                title: Text('Horímetro '),
                                subtitle: Text('4.500h'),
                                //trailing: Text('4.500h'),
                                isThreeLine: false,
                              ),
                              ListTile(
                                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                //contentPadding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                                leading: Icon(Icons.agriculture),
                                title: Text('Consumo Médio'),
                                subtitle: Text('5,6 L/h'),
                                //trailing: Text('5,6 L/h'),
                                isThreeLine: false,
                              ),
                              ListTile(
                                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                //contentPadding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                                leading: Icon(Icons.monetization_on,),
                                title: Text('Custo Horário'),
                                subtitle: Text('R\$\ 150,00 /h'),
                                //trailing: Text('R\$\ 150,00 /h'),
                                isThreeLine: false,

                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
