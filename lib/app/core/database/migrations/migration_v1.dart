import 'package:sqflite/sqflite.dart';

import 'migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table todo(
        id integer primary key autoincrement,
        descricao varchar(255) not null,
        data_hora datetime,
        finalizado integer
      )
    ''');
  }

  @override
  void update(Batch batch) {}
}
