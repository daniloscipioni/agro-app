import 'package:bavaresco/components/data_atual.dart';
import 'package:bavaresco/database/machine_historico_dao.dart';
import 'package:bavaresco/models/historico/historic_info.dart';
import 'package:bavaresco/repository/machineRepository.dart';
import 'package:bavaresco/screens/lista/historico.dart';
import 'package:flutter/material.dart';


class FormularioAtualizarHorimetro extends StatefulWidget{

  final MachineRepository machine;

  FormularioAtualizarHorimetro({Key key, @required this.machine}) : super(key: key);

  @override
  _formularioAtualizarHorimetroState createState() => _formularioAtualizarHorimetroState();
}

class _formularioAtualizarHorimetroState extends State<FormularioAtualizarHorimetro> with TickerProviderStateMixin {

  MachineHistoricoDao _historicoDao = MachineHistoricoDao();

  final TextEditingController _horimetroController =   TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Atualização de Horímetro'),
        centerTitle: true,
      ),
      body: Column(
        children: [
        //  Card(
         //   child:
            //Container(
              //padding: const EdgeInsets.symmetric(vertical: 0.0),
             // child:
              SizedBox(
                height: 90 ,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        //padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
          //  ),
       //  ),
          Divider(
            color: Colors.grey,
            height: 2,
          ),

          Expanded(
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      controller: _horimetroController,
                      decoration: InputDecoration(
                        labelText: 'Horímetro Atual',
                        hintText: '0'
                      ),
                      style: TextStyle(fontSize: 16.0),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: RaisedButton(
                        child: Text('Salvar'),
                        onPressed: () {
                          debugPrint(_horimetroController.text);
                          _historicoDao.saveApontamentoMaquina(
                              HistoricInfo( 2, widget.machine.id, 'Usuário Teste',DateTime.now().millisecondsSinceEpoch, null, null, null, null, int.tryParse(_horimetroController.text), null)
                          ).then((value) => Navigator.pop(context));

                          //Navigator.of(context).pop();

                          debugPrint("Horímetro atualizado");
                          //final String name = _nameController.text;
                          //final int accountNumber = int.tryParse(_accountNumberController.text);
                          //final Contact newContact = Contact(0, name, accountNumber);
                         // _dao.save(newContact).then((id) => Navigator.pop(context));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      //floatingActionButton: buildSpeedDial(),
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