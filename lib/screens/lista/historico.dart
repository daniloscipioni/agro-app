import 'package:bavaresco/components/data_atual.dart';
import 'package:bavaresco/components/number_format.dart';
import 'package:bavaresco/database/machine_historico_dao.dart';
import 'package:bavaresco/menu/menu.dart';
import 'package:bavaresco/repository/machineInfoApontamentoAcumRepository.dart';
import 'package:bavaresco/repository/machineInfoApontamentoRepository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaHistoricoMaquina extends StatefulWidget {
  final InfoApontamentoAcumRepository machine;

  ListaHistoricoMaquina({Key key, @required this.machine}) : super(key: key);

  @override
  _ListaHistoricoMaquinaState createState() => _ListaHistoricoMaquinaState();
}

class _ListaHistoricoMaquinaState extends State<ListaHistoricoMaquina>
    with TickerProviderStateMixin {

  final String _title = "Histórico";
  MachineHistoricoDao _historicoDao = MachineHistoricoDao();

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
                                    if (DateTime.now().year - widget.machine.yearManufacture == 0 && (widget.machine.yearManufacture != 0))
                                      Text('Ano de Fabricação:  ' + widget.machine.yearManufacture.toString())
                                    else Text('Ano de Fabricação:  ' + widget.machine.yearManufacture.toString() + ' (' + (DateTime.now().year - widget.machine.yearManufacture).toString() + ' anos)',


                                      maxLines: 1,
                                    ),
                                    if( widget.machine.serialNumber != null)
                                    Text(
                                      'Número de série:  ' +
                                          widget.machine.serialNumber
                                              .toString(),
                                      maxLines: 1,
                                    ),
                                    // Text(
                                    //   'Motor:  ' +
                                    //       widget.machine.motor.toString(),
                                    //   maxLines: 1,
                                    // ),
                                    // Text(
                                    //   'Potência:  ' +
                                    //       widget.machine.power.toString(),
                                    //   maxLines: 1,
                                    // ),
                                    Text(
                                      'Valor: '  +
                                    NumberFormat.currency(locale: 'pt', symbol: 'R\$').format(widget.machine.value),

                                      maxLines: 1,
                                    ),
                                    if (widget.machine.motorized != 0)
                                    Text(
                                      'Tanque Diesel:  ' +
                                          widget.machine.tankCapacity.round().toString() + ' lts',
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
            child: Scaffold(
              // child: Container(
              // padding: EdgeInsets.all(8.0),
              //height: 200,
              //width: 350,
              //color: Colors.green,
              body: FutureBuilder<List<InfoApontamentoRepository>>(
                initialData: List(),
                //Traz as máquinas do banco local
                future: _historicoDao
                    .findAllInfoApontamentoByMachine(widget.machine.id),
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
                      final List<InfoApontamentoRepository> infosApontamento =
                          snapshot.data;

                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final InfoApontamentoRepository infoApontamento =
                              infosApontamento[index];
                          return _cardHistoricoUnidade(infoApontamento);
                        },
                        itemCount: infosApontamento.length,
                      );
                      break;
                  }
                  return Text('Unknown error');
                },
              ),
            ),
            //   child: ListView(
            //   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   //crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     cardHistoricoUnidade(),
            //     cardHistoricoUnidade(),
            //     cardHistoricoUnidade(),
            //     cardHistoricoUnidade(),
            //     cardHistoricoUnidade(),
            //     cardHistoricoUnidade(),
            //     cardHistoricoUnidade(),
            //   ],
            // ),
          ),
          //),
          //),
        ],
      ),
      floatingActionButton: buildSpeedDial(context, widget.machine),
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

class _cardHistoricoUnidade extends StatelessWidget {
  final InfoApontamentoRepository infoApontamento;

  _cardHistoricoUnidade(this.infoApontamento);

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
                child: _infoHistorico(infoApontamento),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _infoHistorico extends StatelessWidget {
  final InfoApontamentoRepository infoApontamento;

  _infoHistorico(this.infoApontamento);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 6.0, 0, 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),

                child: Text(this.infoApontamento.description,
                            style: TextStyle(fontWeight: FontWeight.bold),
                           ),
              ),
            ],
          ),

          if (this.infoApontamento.infoTanque != null)
            Text(
              'Tanque: ' + this.infoApontamento.infoTanque,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black87,
              ),
            ),
          if (this.infoApontamento.abastecimentoQtde != null)
            Text(
              'Qtde Abastecida: ${patterNumberDouble(this.infoApontamento.abastecimentoQtde)} lts',
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black87,
              ),
            ),
          if (this.infoApontamento.hrmetroAtualAbastecimento != null)
            Text(
              'Horimetro Abastecimento:  ${patterNumber(this.infoApontamento.hrmetroAtualAbastecimento)}',
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black87,
              ),
            ),
          if (this.infoApontamento.hrmetroAtualizacao != null)
            Text(
              'Horimetro atualizado: ' + this.infoApontamento.hrmetroAtualizacao.toString() + ' h',
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black87,
              ),
            ),
          if (this.infoApontamento.aptoDefeitoTipo != null)
            Text(
              'Defeito: ' + this.infoApontamento.aptoDefeitoTipo,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black87,
              ),
            ),
          if (this.infoApontamento.aptoDefeitoObs != null)
            Text(
              'Observação: ' + this.infoApontamento.aptoDefeitoObs,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black87,
              ),
            ),
          if (this.infoApontamento.user != null)
            Text(
              'Funcionário: ' + this.infoApontamento.user,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black87,
              ),
            ),
          if (this.infoApontamento.date != null)
            Text(
              'Data: ' + dataAtual(this.infoApontamento.date).toString(),
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
