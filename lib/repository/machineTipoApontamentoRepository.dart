class TipoApontamentoRepository {
  int _id;
  String _description;


  TipoApontamentoRepository(
      this._id,
      this._description
      );

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return 'TipoApontamentoRepository{_id: $_id, _description: $_description}';
  }
}
