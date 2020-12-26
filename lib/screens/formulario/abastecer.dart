import 'package:bavaresco/components/data_atual.dart';
import 'package:bavaresco/database/machine_historico_dao.dart';
import 'package:bavaresco/models/historico/historic_info.dart';
import 'package:bavaresco/repository/machineRepository.dart';
import 'package:bavaresco/screens/lista/historico.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormularioAbastecer extends StatefulWidget{

  final MachineRepository machine;

  FormularioAbastecer({Key key, @required this.machine}) : super(key: key);

  @override
  _formularioAbastecerState createState() => _formularioAbastecerState();
}

class _formularioAbastecerState extends State<FormularioAbastecer> with TickerProviderStateMixin {

  MachineHistoricoDao _historicoDao = MachineHistoricoDao();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _horimetroAtualController =  TextEditingController();
  String tanqueDropdownValue = 'Tanque Diesel';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text('Abastecimento'),
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
                                      if(widget.machine.fuelType != null)
                                      Text(
                                        'Abaster com: ' + widget.machine.fuelType,
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
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                  DropdownButton<String>(
                      value: tanqueDropdownValue,
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
                          tanqueDropdownValue = newValue;
                        });
                      },
                      items: <String>['Tanque Diesel','Melosa', 'Tanque Querosene','Tanque Etanol', 'Tanque Gasolina']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  TextFormField(
                      controller: _quantidadeController,
                      // ignore: missing_return
                      validator: (value) {
                        if(value.isEmpty || (!isNumber(value.replaceAll(',', '.')))){
                          return 'Valor Inválido';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Quantidade',
                        hintText: '0.0',
                      ),
                      style: TextStyle(fontSize: 12.0),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                        // ignore: deprecated_member_use
                        inputFormatters: [BlacklistingTextInputFormatter(new RegExp('[\\-|\\ ]'))]
                       //  inputFormatters: <TextInputFormatter>[
                       // WhitelistingTextInputFormatter.digitsOnly
                       //  ]
                    ),
                  TextFormField(
                    controller: _horimetroAtualController,
                    // ignore: missing_return
                    validator: (value) {
                      if(value.isEmpty || (!isNumber(value))){
                        return 'Valor Inválido';
                      }
                    },
                        decoration: InputDecoration(
                          labelText: 'Horímetro Atual',
                          hintText: '0.0',
                        ),
                        style: TextStyle(fontSize: 12.0),
                        keyboardType: TextInputType.number,
                      ),
                  RaisedButton(
                      child: Text('Salvar'),
                      onPressed: () {
                        debugPrint(tanqueDropdownValue);
                        //debugPrint(isNumber(_quantidadeController.text).toString());
                        //debugPrint(_horimetroAtualController.text);
                        try{
                          if (_formKey.currentState.validate()) {

                            _historicoDao.saveApontamentoMaquina(
                                HistoricInfo(
                                    1,
                                    widget.machine.id,
                                    'Usuário Teste',
                                    DateTime
                                        .now()
                                        .millisecondsSinceEpoch,
                                    tanqueDropdownValue,
                                    null,
                                    double.tryParse(
                                        _quantidadeController.text.replaceAll(',', '.')),
                                    int.tryParse(
                                        _horimetroAtualController.text.replaceAll(',', '').replaceAll('.', '')),
                                    null,
                                    null)
                            ).then((value) => Navigator.pop(context));
                            debugPrint("Abastecimento Salvo");
                          }
                        }catch(e){
                          debugPrint(e.toString());
                        }

                        //Navigator.of(context).pop();
                        //final String name = _nameController.text;
                        //final int accountNumber = int.tryParse(_accountNumberController.text);
                        //final Contact newContact = Contact(0, name, accountNumber);
                        // _dao.save(newContact).then((id) => Navigator.pop(context));
                      },
                    ),
                  ],
                ),
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

}// Function to validate the number


bool isNumber(String value) {
  if(value == null) {
    return true;
  }
  final n = double.parse(value);
  return n!= null;
}