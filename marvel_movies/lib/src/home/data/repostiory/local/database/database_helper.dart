import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_model.dart';

class DBHelper {
  Database? database;
  String dbName = 'marvel.db';
  String tableName = 'marvel';
  String id = 'id';
  String title = 'title';
  String releaseData = 'releaseDate';
  String boxOffice = 'boxOffice';
  String duration = 'duration';
  String overview = 'overview';
  String coverUrl = 'coverUrl';
  String trailerUrl = 'trailerUrl';
  String directedBy = 'directedBy';
  String phase = 'phase';
  String saga = 'saga';
  String chronology = 'chronology';
  String postCreditScenes = 'postCreditScenes';
  String imdbId = 'imdbId';

  Future openDb() async {
    database = await openDatabase(
      join(await getDatabasesPath(), dbName),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(''' 
  CREATE TABLE $tableName(
    $id INTEGER PRIMARY KEY NOT NULL,
    $title TEXT,
    $releaseData TEXT,
    $boxOffice TEXT,
    $duration INTEGER,
    $overview TEXT,
    $coverUrl TEXT,
    $trailerUrl TEXT,
    $directedBy TEXT,
    $phase INTEGER,
    $saga TEXT,
    $chronology INTEGER,
    $postCreditScenes INTEGER,
    $imdbId TEXT)
    ''');
      },
    );
  }

  Future insertData(DbModel dbModel) async {
    await openDb();

    await database!
        .insert(
          tableName,
          dbModel.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        )
        .then((value) {
          debugPrint("DBVALUE: $value");
        });
  }

  Future<List<DbModel>?> retriveData() async {
    await openDb();
    List<DbModel> dbmodel = [];
    if (database != null) {
      await database!.query(tableName).then((value) {
        dbmodel = value.map((e) => DbModel.fromMap(e)).toList();
      });
    }
    return dbmodel;
  }

  Future onUpdate(DbModel dbModel) async {
    await openDb();
    if (database != null) {
      await database!.update(
        tableName,
        dbModel.toMap(),
        where: 'id=?',
        whereArgs: [dbModel.id],
      );
    }
  }

  Future onDelete(DbModel dbModel) async {
    await openDb();
    if (database != null) {
      await database!.delete(tableName, where: 'id=?', whereArgs: [dbModel.id]);
    }
  }
}
