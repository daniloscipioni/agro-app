class Machine {
  int _id;
  String _machineName;
  int _yearOfManufacture;
  String _serieNumber;
  String _motor;
  String _power;
  double _value;
  int _fuelTank;
  int _idCategory;
  int _idManufacturer;
  int _idModel;

  Machine(
      //this._id,
      this._machineName,
      this._yearOfManufacture,
      this._serieNumber,
      this._motor,
      this._power,
      this._value,
      this._fuelTank,
      this._idCategory,
      this._idManufacturer,
      this._idModel);


  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return 'Machine{id: $_id, machineName: $_machineName, yearOfManufacture: $_yearOfManufacture, serieNumber: $_serieNumber, motor: $_motor, power: $_power, value: $_value, fuelTank: $_fuelTank, idCategory: $_idCategory, idManufacturer: $_idManufacturer, idModel: $_idModel}';
  }


  String get machineName => _machineName;

  set machineName(String value) {
    _machineName = value;
  }

  int get yearOfManufacture => _yearOfManufacture;

  set yearOfManufacture(int value) {
    _yearOfManufacture = value;
  }

  String get serieNumber => _serieNumber;

  set serieNumber(String value) {
    _serieNumber = value;
  }

  String get motor => _motor;

  set motor(String value) {
    _motor = value;
  }

  String get power => _power;

  set power(String value) {
    _power = value;
  }

  double get value => _value;

  set value(double value) {
    _value = value;
  }

  int get fuelTank => _fuelTank;

  set fuelTank(int value) {
    _fuelTank = value;
  }

  int get idCategory => _idCategory;

  set idCategory(int value) {
    _idCategory = value;
  }

  int get idManufacturer => _idManufacturer;

  set idManufacturer(int value) {
    _idManufacturer = value;
  }

  int get idModel => _idModel;

  set idModel(int value) {
    _idModel = value;
  }
}
