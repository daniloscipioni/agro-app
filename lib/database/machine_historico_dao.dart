import 'package:bavaresco/database/app_database.dart';
import 'package:bavaresco/models/historico/historic_type.dart';
import 'package:bavaresco/models/maquina/category.dart';
import 'package:bavaresco/models/maquina/machine.dart';
import 'package:bavaresco/models/maquina/manufacturer.dart';
import 'package:bavaresco/models/maquina/model.dart';
import 'package:bavaresco/repository/machineRepository.dart';
import 'package:bavaresco/repository/machineTipoApontamentoRepository.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

class MachineHistoricoDao {
  static const String _id = 'id';

  static const String _tableTipoApontamento = 'tipo_apontamento';
  static const String _tableHistoricoMaquina = 'categories';

  static const String _description = 'description';

  // static const String _categoryName = 'category_name';
  // static const String _manufacturerName = 'manufacturer_name';
  // static const String _yearManufacture = 'year_manufacture';
  // static const String _serieNumber = 'serie_number';
  // static const String _motor = 'motor';
  // static const String _power = 'power';
  // static const String _value = 'value';
  // static const String _fuelTank = 'fuel_tank';

  // static const String _idMachineManufacturer = 'id_manufacturer';
  // static const String _idMachineCategory = 'id_category';
  // static const String _idModel = 'id_model';

  //static const String _modelName = 'model_name';

  static const String tableTipoApontamento =
      'CREATE TABLE $_tableTipoApontamento('
      '$_id INTEGER PRIMARY KEY, '
      '$_description TEXT '
      // 'FOREIGN KEY($_idMachineManufacturer) REFERENCES $_tableFabricante($_id), '
      // 'FOREIGN KEY($_idMachineCategory) REFERENCES $_tableCategoria($_id),'
      // 'FOREIGN KEY($_idModel) REFERENCES $_tableModelo($_id) '
      ')';

  Future<int> saveTipoApontamento(HistoricType tipoApontamento) async {
    final Database db = await getDatabase();
    Map<String, dynamic> tipoApontamentoMap =
        _toMapTipoApontamento(tipoApontamento);
    return db.insert(_tableTipoApontamento, tipoApontamentoMap);
  }

  Map<String, dynamic> _toMapTipoApontamento(HistoricType tipoApontamento) {
    final Map<String, dynamic> tipoApontamentoMap = Map();
    tipoApontamentoMap[_id] = tipoApontamento.id;
    tipoApontamentoMap[_description] = tipoApontamento.historicName;
    return tipoApontamentoMap;
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
        // 'join $_tableFabricante on $_tableMaquina.$_idMachineManufacturer = $_tableFabricante.$_id '
        // 'join $_tableModelo on $_tableModelo.$_id = $_tableMaquina.$_idModel'
        );

    List<TipoApontamentoRepository> machines = toListTipoApontamento(result);

    return machines;
  }

  //Lista toda a tabela
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
}
