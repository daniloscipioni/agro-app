import 'package:bavaresco/components/number_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoApontamentoAcumRepository {
  int _id;
  String _machineName;
  int _yearManufacture;
  String _serialNumber;
  String _motor;
  String _power;
  double _value;
  int _fuelTank;
  String _machineManufacturer;
  String _machineModel;
  int _motorized;
  String _fuelType;
  double _tankCapacity;
  String _description;
  int _idHistoricType;
  int _idMachine;
  String _user;
  int date;
  String _infoTanque;
  String _aptoDefeitoTipo;
  double _abastecimentoQtde;
  int _hrmetroAtualAbastecimento;
  int _hrmetroAtualizacao;
  String _aptoDefeitoObs;
  double _ultimoAbastecimento;
  int _horimetroAtual;
  double _consumoMedio;

  // String _custoHorario;

  InfoApontamentoAcumRepository(
    this._id,
    this._machineName,
    this._yearManufacture,
    this._serialNumber,
    this._motor,
    this._power,
    this._value,
    this._fuelTank,
    this._machineManufacturer,
    this._machineModel,
    this._motorized,
    this._fuelType,
    this._tankCapacity,
    this._description,
    this._idHistoricType,
    this._idMachine,
    this._user,
    this.date,
    this._infoTanque,
    this._aptoDefeitoTipo,
    this._abastecimentoQtde,
    this._hrmetroAtualAbastecimento,
    this._hrmetroAtualizacao,
    this._aptoDefeitoObs,
    this._ultimoAbastecimento,
    this._horimetroAtual,
    this._consumoMedio,
    // this._custoHorario
  );

  String mainTitle() {
    return '$_machineName - $_machineManufacturer - $_machineModel';
  }

  String ultimoAbastecimentoToString() {
    if (ultimoAbastecimento != null) {
      return '${patterNumberDouble(ultimoAbastecimento)} lts';
    } else {
      return 'N/D';
    }
  }

  String horimetroAtualToString() {
    if (horimetroAtual != null) {
      return '${patterNumber(horimetroAtual)} h';
    } else {
      return 'N/D';
    }
  }

  String anoFabricacaoToString() {
    if (DateTime.now().year - yearManufacture == 0 && (yearManufacture != 0)) {
      return " - ";
    } else {
      String value = ((DateTime.now().year - yearManufacture)).toString();

      return (yearManufacture.toString() + ' (' + value + ' anos)').toString();
    }
  }

  String serialNumberToString() {
    if (serialNumber != '') {
      return serialNumber;
    } else {
      return ' - ';
    }
  }

  String valorToString() {
    if (value != null) {
      return NumberFormat.currency(locale: 'pt', symbol: 'R\$')
          .format(value)
          .toString();
    } else {
      return ' - ';
    }
  }

  String motorizedToString() {
    if (motorized != 0) {
      return tankCapacity.round().toString() + ' lts';
    } else {
      return ' - ';
    }
  }

  String consumoMedioToString() {
    if (consumoMedio != null) {
      return '${patterNumberDouble(consumoMedio)} L/h';
    } else {
      return 'N/D';
    }
  }
  
  // String get custoHorario => _custoHorario;
  //
  // set custoHorario(String value) {
  //   _custoHorario = value;
  // }
  //
  double get consumoMedio => _consumoMedio;

  set consumoMedio(double value) {
    _consumoMedio = value;
  }

  int get horimetroAtual => _horimetroAtual;

  set horimetroAtual(int value) {
    _horimetroAtual = value;
  }

  double get ultimoAbastecimento => _ultimoAbastecimento;

  set ultimoAbastecimento(double value) {
    _ultimoAbastecimento = value;
  }

  String get aptoDefeitoObs => _aptoDefeitoObs;

  set aptoDefeitoObs(String value) {
    _aptoDefeitoObs = value;
  }

  int get hrmetroAtualizacao => _hrmetroAtualizacao;

  set hrmetroAtualizacao(int value) {
    _hrmetroAtualizacao = value;
  }

  int get hrmetroAtualAbastecimento => _hrmetroAtualAbastecimento;

  set hrmetroAtualAbastecimento(int value) {
    _hrmetroAtualAbastecimento = value;
  }

  double get abastecimentoQtde => _abastecimentoQtde;

  set abastecimentoQtde(double value) {
    _abastecimentoQtde = value;
  }

  String get aptoDefeitoTipo => _aptoDefeitoTipo;

  set aptoDefeitoTipo(String value) {
    _aptoDefeitoTipo = value;
  }

  String get infoTanque => _infoTanque;

  set infoTanque(String value) {
    _infoTanque = value;
  }

  String get user => _user;

  set user(String value) {
    _user = value;
  }

  int get idMachine => _idMachine;

  set idMachine(int value) {
    _idMachine = value;
  }

  int get idHistoricType => _idHistoricType;

  set idHistoricType(int value) {
    _idHistoricType = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  double get tankCapacity => _tankCapacity;

  set tankCapacity(double value) {
    _tankCapacity = value;
  }

  String get fuelType => _fuelType;

  set fuelType(String value) {
    _fuelType = value;
  }

  int get motorized => _motorized;

  set motorized(int value) {
    _motorized = value;
  }

  String get machineModel => _machineModel;

  set machineModel(String value) {
    _machineModel = value;
  }

  String get machineManufacturer => _machineManufacturer;

  set machineManufacturer(String value) {
    _machineManufacturer = value;
  }

  int get fuelTank => _fuelTank;

  set fuelTank(int value) {
    _fuelTank = value;
  }

  double get value => _value;

  set value(double value) {
    _value = value;
  }

  String get power => _power;

  set power(String value) {
    _power = value;
  }

  String get motor => _motor;

  set motor(String value) {
    _motor = value;
  }

  String get serialNumber => _serialNumber;

  set serialNumber(String value) {
    _serialNumber = value;
  }

  int get yearManufacture => _yearManufacture;

  set yearManufacture(int value) {
    _yearManufacture = value;
  }

  String get machineName => _machineName;

  set machineName(String value) {
    _machineName = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
