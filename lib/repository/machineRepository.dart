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
  int _motorized;
  String _fuelType;
  double _tankCapacity;


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
      this._machineModel,
      this._motorized,
      this._fuelType,
      this._tankCapacity);


  @override
  String toString() {
    return 'MachineRepository{_id: $_id, _machineName: $_machineName, _yearManufacture: $_yearManufacture, _serialNumber: $_serialNumber, _motor: $_motor, _power: $_power, _value: $_value, _fuelTank: $_fuelTank, _machineManufacturer: $_machineManufacturer, _machineModel: $_machineModel, _motorized: $_motorized, _fuelType: $_fuelType, _tankCapacity: $_tankCapacity}';
  }

  String mainTitle(){
    return '$_id - $_machineName - $_machineManufacturer - $_machineModel' ;
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
