class HistoricInfo {
  final int id;
  final int idHistoricType;
  final int idMachine;
  final int idUser;
  final DateTime date;

  HistoricInfo(
      this.id, this.idHistoricType, this.idMachine, this.idUser, this.date);

  @override
  String toString() {
    return 'HistoricInfo{id: $id, idHistoricType: $idHistoricType, idMachine: $idMachine, idUser: $idUser, date: $date}';
  }
}
