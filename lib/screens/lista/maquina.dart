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
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                machine.mainTitle(),
                                maxLines: 3,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
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




