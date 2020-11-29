class Model {
  final int id;
  final int idMachineManufacturer;
  final String modelName;

  Model(this.id, this.idMachineManufacturer, this.modelName);

  @override
  String toString() {
    return 'Model{id: $id, idMachineManufacturer: $idMachineManufacturer, modelName: $modelName}';
  }
}
