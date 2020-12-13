class Model {
  final int id;
  final int idMachineManufacturer;
  final String modelName;
  final int motorized;
  final String fuelType;
  final double tankCapacity;

  Model(this.id, this.idMachineManufacturer, this.modelName, this.motorized,
      this.fuelType, this.tankCapacity);

  @override
  String toString() {
    return 'Model{id: $id, idMachineManufacturer: $idMachineManufacturer, modelName: $modelName, motorized: $motorized, fuelType: $fuelType, tankCapacity: $tankCapacity}';
  }
}
