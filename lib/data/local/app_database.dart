import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'db/dao/favorite_dao.dart';

class AppDatabase {
  Future<FavoriteDao> favoriteDao() async {
    return FavoriteDao(db: await getInstance());
  }

  Future<Database> getInstance() async {
    return openDatabase(
      join(await getDatabasesPath(), 'movie_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE favorites("
          "id INTEGER PRIMARY KEY, "
          "data TEXT"
          ")",
        );
      },
      version: 1,
    );
  }
}
