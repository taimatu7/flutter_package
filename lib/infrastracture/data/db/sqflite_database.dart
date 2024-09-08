import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabase {
  // シングルトンインスタンス
  static Database? _instance;

  // 内部コンストラクタ
  SqfliteDatabase._internal();

  static Future<Database> getInstance() async {
    final instance = _instance;

    if (instance == null) throw Exception('Database is not initialized.');

    return instance;
  }

  // DBを初期化する
  static Future<void> initialize() async {
    if (_instance != null) return;

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'sqlite.db');
    _instance = await openDatabase(
      path,
      version: 1,
      onCreate: _createTable,
    );
  }

  // テーブル作成
  static Future<void> _createTable(Database db, int version) async {
    await db.execute('CREATE TABLE todo (id INTEGER PRIMARY KEY, value INTEGER)');
  }
}
