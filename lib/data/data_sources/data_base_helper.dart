import 'package:dd_test/data/models/savings_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'savings4.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE savings (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          compA REAL,
          compB REAL,
          history TEXT
        )
      ''');
        await db.insert('savings', {
          'compA': 0.0,
          'compB': 0.0,
          'history': '', // Initialize with an empty string
        });
      },
    );
  }

  Future<SavingsModel> getSavings() async {
    final db = await database;
    final maps = await db.query('savings', limit: 1);
    if (maps.isNotEmpty) {
      return SavingsModel.fromMap(maps.first);
    } else {
      return SavingsModel(compA: 0.0, compB: 0.0, history: []);
    }
  }

  Future<void> updateSavings(SavingsModel savings) async {
    final db = await database;
    await db
        .update('savings', savings.toMap(), where: 'id = ?', whereArgs: [1]);
  }
}
