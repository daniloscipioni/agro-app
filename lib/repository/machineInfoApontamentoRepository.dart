class InfoApontamentoRepository {
 // int _id;
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

  // int get id => _id;
  //
  // set id(int value) {
  //   _id = value;
  // }

  String get description => _description;

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

  set description(String value) {
    _description = value;
  }

  InfoApontamentoRepository(
     // this._id,
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
      this._aptoDefeitoObs);
}
