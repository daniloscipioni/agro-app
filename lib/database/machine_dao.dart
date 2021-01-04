import 'package:bavaresco/database/app_database.dart';
import 'package:bavaresco/models/maquina/category.dart';
import 'package:bavaresco/models/maquina/machine.dart';
import 'package:bavaresco/models/maquina/manufacturer.dart';
import 'package:bavaresco/models/maquina/model.dart';
import 'package:bavaresco/repository/machineInfoApontamentoAcumRepository.dart';
import 'package:bavaresco/repository/machineRepository.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

class MachineDao extends ChangeNotifier {
  static const String _id = 'id';

  static const String _tableMaquina = 'machines';
  static const String _tableCategoria = 'categories';
  static const String _tableFabricante = 'manufacturer';
  static const String _tableModelo = 'model';

  static const String _machineName = 'machine_name';
  static const String _categoryName = 'category_name';
  static const String _manufacturerName = 'manufacturer_name';
  static const String _yearManufacture = 'year_manufacture';
  static const String _serieNumber = 'serie_number';
  static const String _motor = 'motor';
  static const String _power = 'power';
  static const String _value = 'value';
  static const String _fuelTank = 'fuel_tank';

  static const String _motorized = 'motorized';
  static const String _fuelType = 'fuel_type';
  static const String _tankCapacity = 'tank_capacity';

  static const String _idMachineManufacturer = 'id_manufacturer';
  static const String _idMachineCategory = 'id_category';
  static const String _idModel = 'id_model';

  static const String _modelName = 'model_name';

  //Dados Acumulados
  String _ultimoAbastecimento = 'ultimo_abastecimento';
  String _horimetroAtual = 'horimetro_atual';
  String _consumoMedio = 'consumo_medio';
  String _custoHorario = 'custo_horario';


  static const String tableMaquina = 'CREATE TABLE $_tableMaquina('
      '$_id INTEGER PRIMARY KEY, '
      '$_machineName TEXT, '
      '$_yearManufacture INTEGER, '
      '$_serieNumber TEXT, '
      '$_motor TEXT,'
      '$_power TEXT,'
      '$_value DOUBLE,'
      '$_fuelTank INTEGER,'
      '$_idMachineManufacturer INTEGER, '
      '$_idMachineCategory INTEGER, '
      '$_idModel INTEGER, '
      'FOREIGN KEY($_idMachineManufacturer) REFERENCES $_tableFabricante($_id), '
      'FOREIGN KEY($_idMachineCategory) REFERENCES $_tableCategoria($_id),'
      'FOREIGN KEY($_idModel) REFERENCES $_tableModelo($_id) )';

  static const String tableCategoria = 'CREATE TABLE $_tableCategoria('
      '$_id INTEGER PRIMARY KEY, '
      '$_categoryName TEXT)';

  static const String tableFabricante = 'CREATE TABLE $_tableFabricante('
      '$_id INTEGER PRIMARY KEY, '
      '$_manufacturerName TEXT)';

  static const String tableModelo = 'CREATE TABLE $_tableModelo('
      '$_id INTEGER PRIMARY KEY,'
      '$_idMachineManufacturer INTEGER, '
      '$_modelName TEXT, '
      '$_motorized INTEGER, '
      '$_fuelType TEXT, '
      '$_tankCapacity DOUBLE, '
      'FOREIGN KEY($_idMachineManufacturer) REFERENCES $_tableFabricante($_id))';

  Future<int> saveMachine(Machine machine) async {
    final Database db = await getDatabase();
    Map<String, dynamic> machineMap = _toMapMachine(machine);
    return db.insert(_tableMaquina, machineMap);
  }

  Future<int> saveCategory(Category category) async {
    final Database db = await getDatabase();
    Map<String, dynamic> categoryMap = _toMapCategory(category);
    return db.insert(_tableCategoria, categoryMap);
  }

  Future<int> saveManufacturer(Manufacturer manufacturer) async {
    final Database db = await getDatabase();
    Map<String, dynamic> manufacturerMap = _toMapManufacturer(manufacturer);
    return db.insert(_tableFabricante, manufacturerMap);
  }

  Future<int> saveModel(Model model) async {
    final Database db = await getDatabase();
    Map<String, dynamic> modelMap = _toMapModel(model);
    return db.insert(_tableModelo, modelMap);
  }

  Map<String, dynamic> _toMapMachine(Machine machine) {
    final Map<String, dynamic> machineMap = Map();
    //machineMap[_id] = machine.id;
    machineMap[_machineName] = machine.machineName;
    machineMap[_yearManufacture] = machine.yearOfManufacture;
    machineMap[_serieNumber] = machine.serieNumber;
    machineMap[_motor] = machine.motor;
    machineMap[_power] = machine.power;
    machineMap[_value] = machine.value;
    machineMap[_fuelTank] = machine.fuelTank;
    machineMap[_idMachineManufacturer] = machine.idManufacturer;
    machineMap[_idMachineCategory] = machine.idCategory;
    machineMap[_idModel] = machine.idModel;
    return machineMap;
  }

  Map<String, dynamic> _toMapCategory(Category category) {
    final Map<String, dynamic> categoryMap = Map();
    categoryMap[_id] = category.id;
    categoryMap[_categoryName] = category.categoryName;
    return categoryMap;
  }

  Map<String, dynamic> _toMapManufacturer(Manufacturer manufacturer) {
    final Map<String, dynamic> manufacturerMap = Map();
    manufacturerMap[_id] = manufacturer.id;
    manufacturerMap[_manufacturerName] = manufacturer.manufacturerName;
    return manufacturerMap;
  }

  Map<String, dynamic> _toMapModel(Model model) {
    final Map<String, dynamic> modelMap = Map();
    modelMap[_idMachineManufacturer] = model.idMachineManufacturer;
    modelMap[_modelName] = model.modelName;
    modelMap[_motorized] = model.motorized;
    modelMap[_fuelType] = model.fuelType;
    modelMap[_tankCapacity] = model.tankCapacity;

    return modelMap;
  }

  Future<List<Machine>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableMaquina);
    List<Machine> machines = toList(result);
    return machines;
  }

  Future<List<MachineRepository>> findAllMachines() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT '
        '$_tableMaquina.$_id,'
        ' $_machineName,'
        ' $_yearManufacture,'
        ' $_serieNumber,'
        ' $_motor,'
        ' $_power,'
        ' $_value,'
        ' $_fuelTank,'
        ' $_manufacturerName, '
        ' $_modelName,  '
        ' $_motorized, '
        ' $_fuelType, '
        ' $_tankCapacity '
        'FROM $_tableMaquina '
        'join $_tableFabricante on $_tableMaquina.$_idMachineManufacturer = $_tableFabricante.$_id '
        'join $_tableModelo on $_tableModelo.$_id = $_tableMaquina.$_idModel');

    List<MachineRepository> machines = toListMachine(result);

    return machines;
  }

  List<Machine> toList(List<Map<String, dynamic>> result) {
    final List<Machine> machines = List();
    debugPrint(result.toString());
    for (Map<String, dynamic> row in result) {
      final Machine machine = Machine(
         // row[_id],
          row[_machineName],
          row[_yearManufacture],
          row[_serieNumber],
          row[_motor],
          row[_power],
          row[_value],
          row[_fuelTank],
          row[_idMachineManufacturer],
          row[_idMachineCategory],
          row[_idModel]);

      machines.add(machine);
    }

    return machines;
  }

  List<MachineRepository> toListMachine(List<Map<String, dynamic>> result) {
    final List<MachineRepository> machines = List();

    for (Map<String, dynamic> row in result) {
      final MachineRepository machine = MachineRepository(
          row[_id],
          row[_machineName],
          row[_yearManufacture],
          row[_serieNumber],
          row[_motor],
          row[_power],
          row[_value],
          row[_fuelTank],
          row[_manufacturerName],
          row[_modelName],
          row[_motorized],
          row[_fuelType],
          row[_tankCapacity]
      );
      machines.add(machine);
    }

    return machines;
  }

  notifyListeners();
}
