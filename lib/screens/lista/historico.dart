import 'package:bavaresco/menu/menu.dart';
import 'package:bavaresco/repository/machineRepository.dart';
import 'package:flutter/material.dart';

class ListaHistoricoMaquina extends StatefulWidget {
  final MachineRepository machine;

  ListaHistoricoMaquina({Key key, @required this.machine}) : super(key: key);

  @override
  _ListaHistoricoMaquinaState createState() => _ListaHistoricoMaquinaState();
}

class _ListaHistoricoMaquinaState extends State<ListaHistoricoMaquina>
    with TickerProviderStateMixin {

  final String _title = "Histórico";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.sync),
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Sincronizando Banco de Dados!'),
                );

                // Find the Scaffold in the widget tree and use
                // it to show a SnackBar.
                Scaffold.of(context).showSnackBar(snackBar);
              },
            );
          })
        ],
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              //padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: SizedBox(
                height: 150,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        //padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 6.0),
                                child: Column(
                                  children: [
                                    Text(
                                      widget.machine.mainTitle(),
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Ano de Fabricação:  ' +
                                          widget.machine.yearManufacture
                                              .toString(),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Motor:  ' +
                                          widget.machine.motor.toString(),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Potência:  ' +
                                          widget.machine.power.toString(),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Valor:  ' +
                                          widget.machine.value.toString(),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Tanque Diesel:  ' +
                                          widget.machine.fuelTank.toString(),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              )
                              // ],
                              // ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 2,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informações de Histórico',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              //height: 200,
              //width: 350,
              //color: Colors.green,
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cardHistoricoUnidade(),
                  cardHistoricoUnidade(),
                  cardHistoricoUnidade(),
                  cardHistoricoUnidade(),
                  cardHistoricoUnidade(),
                  cardHistoricoUnidade(),
                  cardHistoricoUnidade(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:
      buildSpeedDial(context, widget.machine),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {
      //     _settingModalBottomSheet(context);
      //     print('lista');
      //   },
      // ),
    );
  }
}


class cardHistoricoUnidade extends StatelessWidget {
  const cardHistoricoUnidade({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SizedBox(
          // height: 120,
          // width: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: _infoHistorico(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _infoHistorico extends StatelessWidget {
  const _infoHistorico({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 6.0, 0, 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Text("Abastecimento - 21/11/2020 20:38"),
            ],
          ),
          Text(
            'Horimetro: 4.500h',
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Text(
            'Funcionário: Danilo',
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}