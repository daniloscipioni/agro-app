import 'package:bavaresco/database/machine_dao.dart';
import 'package:bavaresco/models/maquina/item.dart';
import 'package:bavaresco/models/maquina/machine.dart';
import 'package:bavaresco/repository/machineRepository.dart';
import 'package:bavaresco/screens/filtro/formulario.dart';
import 'package:bavaresco/screens/formulario/abastecer.dart';
import 'package:bavaresco/screens/formulario/apontar_defeito.dart';
import 'package:bavaresco/screens/formulario/atualizar_horimetro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../menu.dart';

class ListaMaquinas extends StatelessWidget {
  final MachineDao _dao = MachineDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuHamburger(),
      appBar: AppBar(
        title: Text('Máquinas'),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.sync),
              onPressed: () {
                print('Atualizando');
                final snackBar = SnackBar(
                  content: Text('Sincronizando Banco de Dados!'),
                  action: SnackBarAction(
                    label: 'Desfazer',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                // Find the Scaffold in the widget tree and use
                // it to show a SnackBar.
                Scaffold.of(context).showSnackBar(snackBar);
              },
            );
          })
        ],
      ),
      body: MachinesList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.filter_alt_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          _filtroMaquina(context);
          print('Filtrando');
        },
      ),
    );
  }
}



class ListaMaquinasCadastro extends StatefulWidget {
  final MachineRepository machine;

  ListaMaquinasCadastro({Key key, @required this.machine}) : super(key: key);

  @override
  _ListaMaquinasCadastroState createState() => _ListaMaquinasCadastroState();
}

class _ListaMaquinasCadastroState extends State<ListaMaquinasCadastro>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.sync),
              onPressed: () {
                print('Atualizando ');
                final snackBar = SnackBar(
                  content: Text('Sincronizando Banco de Dados!'),
                  action: SnackBarAction(
                    label: 'Desfazer',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
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
                  cardHistoricoPrincipal(),
                  cardHistoricoPrincipal(),
                  cardHistoricoPrincipal(),
                  cardHistoricoPrincipal(),
                  cardHistoricoPrincipal(),
                  cardHistoricoPrincipal(),
                  cardHistoricoPrincipal(),
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

        SpeedDialChild(
          child: Icon(Icons.filter_alt, color: Colors.white),
          backgroundColor: Colors.grey,
          onTap: () => print('THIRD CHILD'),
          // label:'Filtrar Histórico',
          // labelStyle: TextStyle(fontWeight: FontWeight.w500),
          // labelBackgroundColor: Colors.green,
        ),
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
        SpeedDialChild(
          child: Icon(Icons.access_time, color: Colors.white),
          backgroundColor: Colors.grey,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FormularioAtualizarHorimetro(machine: machine),
              ),
            );
          },
          // label: 'Atualizar Horímetro',
          // labelStyle: TextStyle(fontWeight: FontWeight.w500),
          //labelBackgroundColor: Colors.green,
        ),
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


class cardHistoricoPrincipal extends StatelessWidget {
  const cardHistoricoPrincipal({
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
                child: _cardHistorico(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _cardHistorico extends StatelessWidget {
  const _cardHistorico({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _infoHistorico(),
        ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
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
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                  leading: new Icon(Icons.local_gas_station),
                  title: new Text('Abastecer'),
                  onTap: () => {}),
              new ListTile(
                leading: new Icon(Icons.access_time),
                title: new Text('Atualizar Horímetro'),
                onTap: () => {},
              ),
              new ListTile(
                leading: new Icon(Icons.app_registration),
                title: new Text('Registrar Defeito'),
                onTap: () => {},
              ),
            ],
          ),
        );
      });
}

Future<void> _filtroMaquina(BuildContext context) async {
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
