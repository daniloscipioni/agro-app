import 'package:bavaresco/database/app_database.dart';
import 'package:bavaresco/models/historico/historic_info.dart';
import 'package:bavaresco/models/historico/historic_type.dart';
import 'package:bavaresco/models/maquina/category.dart';
import 'package:bavaresco/models/maquina/machine.dart';
import 'package:bavaresco/models/maquina/manufacturer.dart';
import 'package:bavaresco/models/maquina/model.dart';
import 'package:bavaresco/repository/machineInfoApontamentoRepository.dart';
import 'package:bavaresco/repository/machineRepository.dart';
import 'package:bavaresco/repository/machineTipoApontamentoRepository.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

class MachineHistoricoDao {
  static const String _id = 'id';

  static const String _tableMaquina = 'machines';

  static const String _tableTipoApontamento = 'tipo_apontamento';
  static const String _tableApontamentoMaquina = 'historico_maquina';

  static const String _description = 'description';

  static const String _infoTanque = 'info_tanque';
  static const String _abastecimentoQtde = 'abastecimento_qtde';
  static const String _hrmetroAtualAbastecimento = 'hrmtro_atual_abastecimento';
  static const String _hrmetroAtualizacao = 'htmetro_atualizacao';
  static const String _aptoDefeitoTipo = 'apto_defeito_tipo';
  static const String _aptoDefeitoObs = 'apto_defeito_obs';

  static const String _idHistoricType = 'id_hitoric_type';
  static const String _user = 'user';
  static const String _date = 'date';



  static const String _idMachine = 'id_machine';


  static const String tableTipoApontamento =
      'CREATE TABLE $_tableTipoApontamento('
      '$_id INTEGER PRIMARY KEY, '
      '$_description TEXT '
      ')';

  static const String tableApontamentoMaquina =
      'CREATE TABLE $_tableApontamentoMaquina('
      '$_id INTEGER PRIMARY KEY, '
      '$_idMachine INTEGER, '
      '$_idHistoricType INTEGER, '
      '$_user STRING, '
      '$_date DATE, '
      '$_infoTanque STRING, '
      '$_aptoDefeitoTipo STRING, '
      '$_abastecimentoQtde DOUBLE, '
      '$_hrmetroAtualAbastecimento INTEGER, '
      '$_hrmetroAtualizacao INTEGER, '
      '$_aptoDefeitoObs TEXT, '
      'FOREIGN KEY($_idMachine) REFERENCES $_tableMaquina($_id), '
      'FOREIGN KEY($_idHistoricType) REFERENCES $_tableTipoApontamento($_id)'
      ')';



  Future<int> saveTipoApontamento(HistoricType tipoApontamento) async {
    final Database db = await getDatabase();
    Map<String, dynamic> tipoApontamentoMap =
        _toMapTipoApontamento(tipoApontamento);
    return db.insert(_tableTipoApontamento, tipoApontamentoMap);
  }

  Future<int> saveApontamentoMaquina(HistoricInfo infoApontamento) async {
    final Database db = await getDatabase();
    Map<String, dynamic> infoApontamentoMap =
    _toMapInfoApontamento(infoApontamento);
    return db.insert(_tableApontamentoMaquina, infoApontamentoMap);
  }

  Map<String, dynamic> _toMapTipoApontamento(HistoricType tipoApontamento) {
    final Map<String, dynamic> tipoApontamentoMap = Map();
    tipoApontamentoMap[_id] = tipoApontamento.id;
    tipoApontamentoMap[_description] = tipoApontamento.historicName;
    return tipoApontamentoMap;
  }

  Map<String, dynamic> _toMapInfoApontamento(HistoricInfo infoApontamento) {
    final Map<String, dynamic> infoApontamentoMap = Map();
    //infoApontamentoMap[_id] = infoApontamento.id;
    infoApontamentoMap[_idMachine] = infoApontamento.idMachine;
    infoApontamentoMap[_idHistoricType] = infoApontamento.idHistoricType;
    infoApontamentoMap[_user] = infoApontamento.user;
    infoApontamentoMap[_date] = infoApontamento.date;
    infoApontamentoMap[_infoTanque] = infoApontamento.infoTanque;
    infoApontamentoMap[_aptoDefeitoTipo] = infoApontamento.aptoDefeitoTipo;
    infoApontamentoMap[_abastecimentoQtde] = infoApontamento.abastecimentoQtde;
    infoApontamentoMap[_hrmetroAtualAbastecimento] = infoApontamento.hrmetroAtualAbastecimento;
    infoApontamentoMap[_hrmetroAtualizacao] = infoApontamento.hrmetroAtualizacao;
    infoApontamentoMap[_aptoDefeitoObs] = infoApontamento.aptoDefeitoObs;

    return infoApontamentoMap;
  }

  Future<List<HistoricType>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(_tableTipoApontamento);
    List<HistoricType> tiposApontamento = toList(result);
    return tiposApontamento;
  }

  Future<List<TipoApontamentoRepository>> findAllTipoApontamento() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT '
        '$_id,'
        ' $_description'
        ' FROM $_tableTipoApontamento '
        );

    List<TipoApontamentoRepository> machines = toListTipoApontamento(result);

    return machines;
  }

  //Lista todos os apontamentos
  Future<List<InfoApontamentoRepository>> findAllInfoApontamento() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT '
        '$_id, '
        '$_idMachine, '
        '$_idHistoricType, '
        '$_user, '
        '$_date, '
        '$_infoTanque, '
        '$_aptoDefeitoTipo, '
        '$_abastecimentoQtde, '
        '$_hrmetroAtualAbastecimento, '
        '$_hrmetroAtualizacao, '
        '$_aptoDefeitoObs '
        ' FROM $_tableApontamentoMaquina '
    );

    List<InfoApontamentoRepository> apontamentos = toListInfoApontamento(result);

    return apontamentos;
  }

  //Lista todos os apontamentos por máquina
  Future<List<InfoApontamentoRepository>> findAllInfoApontamentoByMachine(int idMachine) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT '
        '$_tableApontamentoMaquina.$_id, '
        '$_tableApontamentoMaquina.$_idMachine, '
        '$_tableTipoApontamento.$_description, '
        '$_idHistoricType, '
        '$_user, '
        '$_date, '
        '$_infoTanque, '
        '$_aptoDefeitoTipo, '
        '$_abastecimentoQtde, '
        '$_hrmetroAtualAbastecimento, '
        '$_hrmetroAtualizacao, '
        '$_aptoDefeitoObs '
        ' FROM $_tableApontamentoMaquina '
        ' JOIN $_tableTipoApontamento on $_tableTipoApontamento.$_id = $_tableApontamentoMaquina.$_idHistoricType '
        'WHERE $_idMachine = $idMachine '
        'ORDER BY $_date desc'
    );

    List<InfoApontamentoRepository> apontamentos = toListInfoApontamento(result);

    return apontamentos;
  }

  //Lista toda a tabela tipo de apontamento
  List<HistoricType> toList(List<Map<String, dynamic>> result) {
    final List<HistoricType> tiposApontamento = List();
    debugPrint(result.toString());
    for (Map<String, dynamic> row in result) {
      final HistoricType tipoApontamento = HistoricType(
        row[_id],
        row[_description],
      );

      tiposApontamento.add(tipoApontamento);
    }

    return tiposApontamento;
  }

  //Lista os campos descritos
  List<TipoApontamentoRepository> toListTipoApontamento(
      List<Map<String, dynamic>> result) {
    final List<TipoApontamentoRepository> tiposApontamento = List();

    for (Map<String, dynamic> row in result) {
      final TipoApontamentoRepository tipoApontamento =
          TipoApontamentoRepository(
        row[_id],
        row[_description],
      );
      tiposApontamento.add(tipoApontamento);
    }

    return tiposApontamento;
  }

  //Lista os campos descritos
  List<InfoApontamentoRepository> toListInfoApontamento(
      List<Map<String, dynamic>> result) {
    final List<InfoApontamentoRepository> infosApontamento = List();

    for (Map<String, dynamic> row in result) {
      final InfoApontamentoRepository infoApontamento =
      InfoApontamentoRepository(
         // row[_id],
          row[_description],
          row[_idMachine],
          row[_idHistoricType],
          row[_user],
          row[_date],
          row[_infoTanque],
          row[_aptoDefeitoTipo],
          row[_abastecimentoQtde],
          row[_hrmetroAtualAbastecimento],
          row[_hrmetroAtualizacao],
          row[_aptoDefeitoObs]
      );
      infosApontamento.add(infoApontamento);
    }

    return infosApontamento;
  }
}
