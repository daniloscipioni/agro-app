import 'package:bavaresco/components/number_format.dart';
import 'package:bavaresco/database/machine_dao.dart';
import 'package:bavaresco/database/machine_historico_dao.dart';
import 'package:bavaresco/repository/machineInfoApontamentoAcumRepository.dart';
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
      body: MachinesList(),
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
    );
    // });
  }
}

class MachinesList extends StatelessWidget {

  final MachineHistoricoDao _daoAcum = MachineHistoricoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<InfoApontamentoAcumRepository>>(
        initialData: List(),
        //Traz as máquinas do banco local

        future: _daoAcum.findAllInfoApontamentoByMachineAcum(),
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
              final List<InfoApontamentoAcumRepository> machines =
                  snapshot.data;

              return ListView.builder(
                itemBuilder: (context, index) {
                  final InfoApontamentoAcumRepository machine = machines[index];

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
    // });
  }
}

class _machineItem extends StatefulWidget {
  final InfoApontamentoAcumRepository machine;

  _machineItem(this.machine);

  @override
  __machineItemState createState() => __machineItemState();
}

class __machineItemState extends State<_machineItem> {
  final MachineHistoricoDao _daoAcum = MachineHistoricoDao();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.green,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
              bottomLeft: const Radius.circular(10.0),
            )),
        // padding: EdgeInsets.all(8.0),
        child: ExpansionTile(
          title: widget.machine.mainTitle() != null
              ? Text(
                  widget.machine.mainTitle(),

                  //maxLines: 5,
                  style: const TextStyle(
                      //fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                )
              : null,

          //subtitle: Text(machine.machineManufacturer),
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
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

                                subtitle: (widget.machine.ultimoAbastecimento !=
                                        'null')
                                    ? Text(patterNumber(int.parse(widget
                                            .machine.ultimoAbastecimento)) +
                                        ' h')
                                    : Text('N/D'),
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
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                          return new ListaHistoricoMaquina(
                                              machine: widget.machine);
                                        }),
                                      ).then((value) =>

                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ListaMaquinas(),
                                              ),
                                            ),

                                            // _machineItem = _machineItem(widget.machine);
                                        );
                                    },
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
      ),
    ); //;
  }
}
