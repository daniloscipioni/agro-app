import 'package:bavaresco/database/machine_dao.dart';
import 'package:bavaresco/database/machine_historico_dao.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bavaresco.db');

    return openDatabase(
        path,
        onCreate: (db, version) {
          db.execute(MachineDao.tableMaquina);
          db.execute(MachineDao.tableCategoria);
          db.execute(MachineDao.tableFabricante);
          db.execute(MachineDao.tableModelo);
          db.execute(MachineHistoricoDao.tableTipoApontamento);
          db.execute(MachineHistoricoDao.tableApontamentoMaquina);
        },
        version: 1,
        onDowngrade: onDatabaseDowngradeDelete,

    );

}


