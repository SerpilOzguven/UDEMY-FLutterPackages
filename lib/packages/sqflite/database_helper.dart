
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  DatabaseHelper._init();

  static Database? _database;

  Future<Database> get database async {
    if (database != null) return _database!;

    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    var exists = await databaseExists(path);
    if (!exists) {
      var data = await rootBundle.load(join('assets', 'db', 'users.db'));
      List<int> bytes = data.buffer.asUint8List(
          data.offsetInBytes, data.lengthInBytes);
      //Write and flush the bytes written
      await File(path).writeAsBytes(path as List<int>, flush: true);
    }
    return await openDatabase(path, readOnly: false);
  }
  addUser()async{
    var db = await instance.database;
    var id = await db.insert('user', {'name': 'Burak'});
    print(id);


  }
}