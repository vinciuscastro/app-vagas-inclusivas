import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../providers/job.dart';

class DatabaseHelper {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'app_database.db');
    return openDatabase(path, onCreate: (db, version) async {
      await db.execute(
          """CREATE TABLE favorite_jobs (
            id TEXT PRIMARY KEY,
            name TEXT,
            description TEXT,
            salary REAL,
            location TEXT,
            company TEXT,
            type TEXT,
            modality TEXT,
            minority TEXT,
            schedule TEXT,
            benefits TEXT
          )""");
      

    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DatabaseHelper.database();

    db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Job>> getData(String table) async {
    final db = await DatabaseHelper.database();
    final List<Map<String, dynamic>> data = await db.query(table);
    return List.generate(data.length, (index) {
      return Job(
        id: data[index]['id'],
        name: data[index]['name'],
        description: data[index]['description'],
        salary: data[index]['salary'],
        location: data[index]['location'],
        company: data[index]['company'],
        type: data[index]['type'],
        modality: data[index]['modality'],
        minority: data[index]['minority'],
        schedule: data[index]['schedule'],
        benefits: data[index]['benefits'].split(','),
        isFavorite: true,
      );
    });
  }


  static Future<void> update(String table, Map<String, Object> data) async {
    final db = await DatabaseHelper.database();
    db.update(table, data, where: 'id = ?', whereArgs: [data['id']]);
  }

  static Future<void> delete(String table, String id) async {
    final db = await DatabaseHelper.database();
    db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
