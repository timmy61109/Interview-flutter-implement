import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteHelper {
  final String sqlFileName = 'mydb.sql';
  final table = 'post';
  Database? db;
  open() async {
    if (db == null) {
      db = await openDatabase(
        join(await getDatabasesPath(), sqlFileName),
        version: 1,
        onCreate: (db, ver) async {
          await db.execute('''
          Create Table post(
            id integer primary key,
            userId integer,
            title text,
            body text
          );
          ''');
        }
      );
    }

  }
  insert(Map<String, dynamic> m) async {
    await db!.insert(table, m);
  }
  queryAll() async {
    return await db!.query(
      table,
      columns: null
    );
  }
}
