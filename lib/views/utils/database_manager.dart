import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        priority TEXT,
        title TEXT,
        description TEXT,
        isArchived INTEGER DEFAULT 0,
        isCompleted INTEGER DEFAULT 0
      )
    ''');
  }

  Future<int> updateTask(int id, Map<String, dynamic> updatedTask) async {
    try {
      Database db = await database;
      return await db.update('tasks', updatedTask, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print("Error updating task: $e");
      return -1;
    }
  }

  Future<int> insertTask(Map<String, dynamic> task) async {
    Database db = await database;
    return await db.insert('tasks', {...task, 'isArchived': 0, 'isCompleted': 0});
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    Database db = await database;
    return await db.query('tasks');
  }

  Future<int> deleteTask(int id) async {
    Database db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllTasks() async {
    try {
      Database db = await database;
      await db.transaction((txn) async {
        await txn.execute('DROP TABLE IF EXISTS tasks');

        await txn.execute('''
        CREATE TABLE tasks(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          priority TEXT,
          title TEXT,
          description TEXT,
          isArchived INTEGER DEFAULT 0,
          isCompleted INTEGER DEFAULT 0
        )
      ''');
      });
    } catch (e) {
      print("Error deleting all tasks: $e");
    }
  }

  Future<void> toggleTaskArchived(int id, bool isArchived) async {
    try {
      Database db = await database;
      await db.update(
        'tasks',
        {'isArchived': isArchived ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print("Error toggling task to archive: $e");
    }
  }

  Future<void> toggleTaskCompletion(int id, bool isCompleted) async {
    try {
      Database db = await database;
      await db.update(
        'tasks',
        {'isCompleted': isCompleted ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print("Error toggling task completion: $e");
    }
  }
}
