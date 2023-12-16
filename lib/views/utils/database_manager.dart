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
        description TEXT
      )
    ''');
  }

  // Update an existing task by ID
  Future<int> updateTask(int id, Map<String, dynamic> updatedTask) async {
    try {
      Database db = await database;
      return await db.update('tasks', updatedTask, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print("Error updating task: $e");
      return -1;
    }
  }

  // Saves a new task on db
  Future<int> insertTask(Map<String, dynamic> task) async {
    Database db = await database;
    return await db.insert('tasks', task);
  }

  // Fetches task data
  Future<List<Map<String, dynamic>>> getTasks() async {
    Database db = await database;
    return await db.query('tasks');
  }

  // Delete a single task by ID
  Future<int> deleteTask(int id) async {
    Database db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  // Delete all tasks
  Future<void> deleteAllTasks() async {
    try {
      Database db = await database;
      await db.transaction((txn) async {
        // Drop the 'tasks' table
        await txn.execute('DROP TABLE IF EXISTS tasks');

        // Recreate the 'tasks' table
        await txn.execute('''
        CREATE TABLE tasks(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          priority TEXT,
          title TEXT,
          description TEXT
        )
      ''');
      });
    } catch (e) {
      print("Error deleting all tasks: $e");
    }
  }
}
