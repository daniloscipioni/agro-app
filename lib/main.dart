import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:bavaresco/database/machine_dao.dart';
import 'package:bavaresco/database/machine_historico_dao.dart';
import 'package:bavaresco/models/historico/historic_info.dart';
import 'package:bavaresco/models/historico/historic_type.dart';
import 'package:bavaresco/models/maquina/category.dart';
import 'package:bavaresco/models/maquina/manufacturer.dart';
import 'package:bavaresco/models/maquina/model.dart';
import 'package:bavaresco/repository/machineTipoApontamentoRepository.dart';
import 'package:bavaresco/screens/lista/maquina.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'database/app_database.dart';
import 'models/maquina/machine.dart';

void main() {
  runApp(BavarescoApp());

   MachineDao _dao  = MachineDao();
   MachineHistoricoDao _historicoDao = MachineHistoricoDao();
  // //
  _dao.saveCategory(Category(1, 'Trator'));
  _dao.saveCategory(Category(2, 'Colheitadeira'));
  _dao.saveCategory(Category(3, 'Plantadeira'));
  _dao.saveCategory(Category(4, 'Pulverizador'));
  _dao.saveCategory(Category(5, 'Implemento'));

  _dao.saveManufacturer(Manufacturer(1, 'Valtra'));
  _dao.saveManufacturer(Manufacturer(2, 'John Deere'));
  _dao.saveManufacturer(Manufacturer(3, 'Fiatalis'));
  _dao.saveManufacturer(Manufacturer(4, 'Massey Fergunson'));
  _dao.saveManufacturer(Manufacturer(5, 'Case IH'));
  _dao.saveManufacturer(Manufacturer(6, 'New Holland'));
  _dao.saveManufacturer(Manufacturer(7, 'Fendt'));
  _dao.saveManufacturer(Manufacturer(8, 'Stara'));
  _dao.saveManufacturer(Manufacturer(9, 'CBT'));
  _dao.saveManufacturer(Manufacturer(10, 'Valmet'));
  _dao.saveManufacturer(Manufacturer(11, 'Landini'));
  _dao.saveManufacturer(Manufacturer(12, 'Jacto'));
  _dao.saveManufacturer(Manufacturer(13, 'JCB'));
  _dao.saveManufacturer(Manufacturer(14, 'Jan'));
  _dao.saveManufacturer(Manufacturer(15, 'Jumil'));
  _dao.saveManufacturer(Manufacturer(16, 'MP Agro'));
  //
  _dao.saveModel(Model(1,9,'2600',1,'Diesel',350));
  _dao.saveModel(Model(2,10,'88',1,'Diesel',350));
  _dao.saveModel(Model(3,10,'1180',1,'Diesel',350));
  _dao.saveModel(Model(4,10,'1580',1,'Diesel',350));
  _dao.saveModel(Model(5,1,'BT 150',1,'Diesel',350));
  _dao.saveModel(Model(6,1,'BH 205',1,'Diesel',350));
  _dao.saveModel(Model(7,1,'BT 210',1,'Diesel',350));
  _dao.saveModel(Model(8,4,'8670',1,'Diesel',350));
  _dao.saveModel(Model(9,1,'S 353',1,'Diesel',350));
  _dao.saveModel(Model(10,7,'1050 Vario',1,'Diesel',350));
  _dao.saveModel(Model(11,2,'6300',1,'Diesel',350));
  _dao.saveModel(Model(12,2,'7815',1,'Diesel',350));
  _dao.saveModel(Model(13,2,'8335 R',1,'Diesel',350));
  _dao.saveModel(Model(14,11,'Landforce 120',1,'Diesel',350));
  _dao.saveModel(Model(15,1,'BC 7500',1,'Diesel',350));
  _dao.saveModel(Model(16,1,'BC 8800',1,'Diesel',350));
  _dao.saveModel(Model(17,4,'MF 9895',1,'Diesel',350));
  _dao.saveModel(Model(18,2,'STS 9750',1,'Diesel',350));
  _dao.saveModel(Model(19,2,'S680',1,'Diesel',350));
  _dao.saveModel(Model(20,2,'STS 9770',1,'Diesel',350));
  _dao.saveModel(Model(21,1,'BS3020H',1,'Diesel',350));
  _dao.saveModel(Model(22,2,'4730',1,'Diesel',350));
  _dao.saveModel(Model(23,8,'Hercules',0,null,null));
  _dao.saveModel(Model(24,14,'Jan 20.000',0,null,null));
  _dao.saveModel(Model(25,15,'FERT PRECISA 6M3',0,null,null));
  _dao.saveModel(Model(26,16,'MP AGRO',0,null,null));
  //
  _dao.saveMachine(Machine('TR-1',1986,'Serie 264',null,null,20000,null,1,9,1));
  _dao.saveMachine(Machine('TR-10',1986,'',null,null,25000,null,1,10,2));
  _dao.saveMachine(Machine('TR-11',1991,'114000044',null,null,35000,null,1,10,3));
  _dao.saveMachine(Machine('TR-12',1995,'4VH-B17-027',null,null,40000,null,1,10,4));
  _dao.saveMachine(Machine('TR-13',2010,'AAAT2010AAM002129',null,null,130000,null,1,1,6));
  _dao.saveMachine(Machine('TR-14',2011,'T150370039',null,null,120000,null,1,1,5));
  _dao.saveMachine(Machine('TR-15',2012,'AAAT2013KCM000811',null,null,150000,null,1,1,7));
  _dao.saveMachine(Machine('TR-16',2012,'AAAT2013KCM000842',null,null,150000,null,1,1,7));
  _dao.saveMachine(Machine('TR-17',2013,'C144014',null,null,400000,null,1,4,8));
  _dao.saveMachine(Machine('TR-18',2013,'S353365303/D088023',null,null,400000,null,1,1,9));
  _dao.saveMachine(Machine('TR-19',2013,'S353361704/D113079',null,null,400000,null,1,1,9));
  _dao.saveMachine(Machine('TR-2',1986,' ',null,null,25000,null,1,10,2));
  _dao.saveMachine(Machine('TR-20',2018,'WAM53023V00F05123',null,null,1200000,null,1,7,10));
  _dao.saveMachine(Machine('TR-21',2010,'T210275612',null,null,150000,null,1,1,7));
  _dao.saveMachine(Machine('TR-3',2001,'C06300A013255',null,null,60000,null,1,2,11));
  _dao.saveMachine(Machine('TR-4',2008,'BM7915X080358',null,null,120000,null,1,2,12));
  _dao.saveMachine(Machine('TR-5',2013,'1RW8335RTCP063410',null,null,400000,null,1,2,13));
  _dao.saveMachine(Machine('TR-6',2018,'TKVLG15838',null,null,100000,null,1,11,14));
  _dao.saveMachine(Machine('CO-4',2008,'7500243575',null,null,200000,null,2,1,15));
  _dao.saveMachine(Machine('CO-5',2010,'7500268637',null,null,290000,null,2,1,15));
  _dao.saveMachine(Machine('CO-6',2010,'7500268635',null,null,290000,null,2,1,15));
  _dao.saveMachine(Machine('CO-7',2010,'7500264647',null,null,220000,null,2,1,15));
  _dao.saveMachine(Machine('CO-8',2011,'7500330136',null,null,320000,null,2,1,15));
  _dao.saveMachine(Machine('CO-9',2011,'7500330137',null,null,320000,null,2,1,15));
  _dao.saveMachine(Machine('CO-10',2011,'7500330135',null,null,320000,null,2,1,15));
  _dao.saveMachine(Machine('CO-11',2014,'7500385751',null,null,420000,null,2,1,15));
  _dao.saveMachine(Machine('CO-12',2013,'7500382550',null,null,420000,null,2,1,15));
  _dao.saveMachine(Machine('CO-13',2014,'AAAC1010HES000016',null,null,750000,null,2,1,16));
  _dao.saveMachine(Machine('CO-14',2015,'AAAC1010TFS000104',null,null,750000,null,2,4,17));
  _dao.saveMachine(Machine('CO-15',2015,'AAAC1010CES000043',null,null,850000,null,2,1,16));
  _dao.saveMachine(Machine('CO-16',2015,'AAAC1010HES000033',null,null,850000,null,2,1,16));
  _dao.saveMachine(Machine('CO-1',2008,'CQ9750A080167',null,null,350000,null,2,2,18));
  _dao.saveMachine(Machine('CO-2',2012,'1H0S680SVC0747885',null,null,900000,null,2,2,19));
  _dao.saveMachine(Machine('CO-3',2013,'1CQ9770ALD0092386',null,null,650000,null,2,2,20));
  _dao.saveMachine(Machine('PV-5',2012,'3020350115/AAAS0300HCC000283',null,null,300000,null,4,1,21));
  _dao.saveMachine(Machine('PV-6',2014,'3020377501/AAAS0300KDC000678',null,null,380000,null,4,1,21));
  _dao.saveMachine(Machine('PV-1',2008,'NO4730X004096',null,null,280000,null,4,2,22));
  _dao.saveMachine(Machine('IM-12',2011,'00/1300',null,null,40000,null,5,8,23));
  _dao.saveMachine(Machine('IM-14',2012,' ',null,null,8000,null,5,14,24));
  _dao.saveMachine(Machine('IM-15',2018,'2018/5075061',null,null,120000,null,5,15,25));
  _dao.saveMachine(Machine('IM-3',2016,'HEA-BF10009',null,null,100000,null,5,8,23));
  _dao.saveMachine(Machine('IM-4',0,' ',null,null,350000,null,5,16,26));

  _historicoDao.saveTipoApontamento(HistoricType(1, 'Abastecimento'));//.then((id) => _historicoDao.findAllTipoApontamento().then((historicType) => debugPrint(historicType.toString())));
  _historicoDao.saveTipoApontamento(HistoricType(2, 'Atualização Horímetro'));//.then((id) => _historicoDao.findAllTipoApontamento().then((historicType) => debugPrint(historicType.toString())));
  _historicoDao.saveTipoApontamento(HistoricType(3, 'Apontamento de Defeito'));//.then((id) => _historicoDao.findAllTipoApontamento().then((historicType) => debugPrint(historicType.toString())));

  // int timeInMillis = 1607861390975;
  //
  // var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
  // //var formattedDate = DateFormat.
  // var dateNow = DateFormat("dd/MM/yyyy hh:mm").format(date);
  // debugPrint(dateNow);
}

class BavarescoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.greenAccent[700],
          textTheme: ButtonTextTheme.accent,
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(secondary: Colors.white), // Text color
        ),
      ),
      home: ListaMaquinas(),
    );
  }
}