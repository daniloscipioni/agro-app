import 'package:bavaresco/database/machine_historico_dao.dart';
import 'package:bavaresco/repository/machineInfoApontamentoAcumRepository.dart';
import 'package:flutter/cupertino.dart';

class InfoMaquina extends ChangeNotifier{
   MachineHistoricoDao _daoAcum = MachineHistoricoDao();
   Future<List<InfoApontamentoAcumRepository>>  _teste  ;

   Future<List<InfoApontamentoAcumRepository>> get teste => _daoAcum.findAllInfoApontamentoByMachineAcum();

   notifyListeners();
}