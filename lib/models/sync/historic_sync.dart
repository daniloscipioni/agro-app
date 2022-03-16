// To parse this JSON data, do
//
//     final historicSync = historicSyncFromJson(jsonString);

import 'dart:convert';

HistoricSync historicSyncFromJson(String str) => HistoricSync.fromJson(json.decode(str));

String historicSyncToJson(HistoricSync data) => json.encode(data.toJson());

class HistoricSync {
  HistoricSync({
    this.data,
    this.success,
    this.rowCount,
  });

  List<Datum> data;
  bool success;
  int rowCount;

  factory HistoricSync.fromJson(Map<String, dynamic> json) => HistoricSync(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    success: json["success"],
    rowCount: json["rowCount"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "rowCount": rowCount,
  };
}

class Datum {
  Datum({
    this.id,
    this.idMachine,
    this.idHitoricType,
    this.userApt,
    this.date,
    this.infoTanque,
    this.aptoDefeitoTipo,
    this.abastecimentoQtde,
    this.hrmtroAtualAbastecimento,
    this.htmetroAtualizacao,
    this.aptoDefeitoObs,
  });

  int id;
  int idMachine;
  int idHitoricType;
  String userApt;
  int date;
  String infoTanque;
  dynamic aptoDefeitoTipo;
  String abastecimentoQtde;
  int hrmtroAtualAbastecimento;
  dynamic htmetroAtualizacao;
  dynamic aptoDefeitoObs;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    idMachine: json["id_machine"],
    idHitoricType: json["id_hitoric_type"],
    userApt: json["user_apt"],
    date: json["date"],
    infoTanque: json["info_tanque"],
    aptoDefeitoTipo: json["apto_defeito_tipo"],
    abastecimentoQtde: json["abastecimento_qtde"],
    hrmtroAtualAbastecimento: json["hrmtro_atual_abastecimento"],
    htmetroAtualizacao: json["htmetro_atualizacao"],
    aptoDefeitoObs: json["apto_defeito_obs"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_machine": idMachine,
    "id_hitoric_type": idHitoricType,
    "user_apt": userApt,
    "date": date,
    "info_tanque": infoTanque,
    "apto_defeito_tipo": aptoDefeitoTipo,
    "abastecimento_qtde": abastecimentoQtde,
    "hrmtro_atual_abastecimento": hrmtroAtualAbastecimento,
    "htmetro_atualizacao": htmetroAtualizacao,
    "apto_defeito_obs": aptoDefeitoObs,
  };
}
