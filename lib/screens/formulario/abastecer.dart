import 'package:bavaresco/repository/machineRepository.dart';
import 'package:flutter/material.dart';

class FormularioAbastecer extends StatefulWidget{

  final MachineRepository machine;

  FormularioAbastecer({Key key, @required this.machine}) : super(key: key);

  @override
  _formularioAbastecerState createState() => _formularioAbastecerState();
}

class _formularioAbastecerState extends State<FormularioAbastecer> with TickerProviderStateMixin {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
  TextEditingController();
  String dropdownValue = 'Tanque';

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
                  DropdownButton<String>(
                    value: dropdownValue,
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
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Tanque','Tanque 1', 'Tanque 2','Tanque 3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Quantidade',
                    ),
                    style: TextStyle(fontSize: 12.0),
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      controller: _accountNumberController,
                      decoration: InputDecoration(
                        labelText: 'Horímetro Atual',
                      ),
                      style: TextStyle(fontSize: 12.0),
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
                          debugPrint("Abastecimento Salvo");
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