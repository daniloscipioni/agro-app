class Manufacturer {
  final int id;
  final String manufacturerName;

  Manufacturer(this.id, this.manufacturerName);

  @override
  String toString() {
    return 'Manufacturer{id: $id, manufacturerName: $manufacturerName}';
  }
}
