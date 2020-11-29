class MachineRepository {
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

  MachineRepository(
      this._id,
      this._machineName,
      this._yearManufacture,
      this._serialNumber,
      this._motor,
      this._power,
      this._value,
      this._fuelTank,
      this._machineManufacturer,
      this._machineModel);


  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return '$_machineName - $_machineManufacturer - $_machineModel - $_yearManufacture - $_serialNumber';
  }

  String mainTitle(){
    return '$_id - $_machineName - $_machineManufacturer - $_machineModel' ;
  }

  String get machineName => _machineName;

  set machineName(String value) {
    _machineName = value;
  }

  int get yearManufacture => _yearManufacture;

  set yearManufacture(int value) {
    _yearManufacture = value;
  }

  String get serialNumber => _serialNumber;

  set serialNumber(String value) {
    _serialNumber = value;
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

  String get machineManufacturer => _machineManufacturer;

  set machineManufacturer(String value) {
    _machineManufacturer = value;
  }

  String get machineModel => _machineModel;

  set machineModel(String value) {
    _machineModel = value;
  }
}
