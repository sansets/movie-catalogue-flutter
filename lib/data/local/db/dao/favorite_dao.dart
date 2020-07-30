import 'package:flutter/cupertino.dart';
import 'package:movie_catalogue/data/local/db/entity/favorite.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDao {
  Database _db;

  FavoriteDao({@required Database db}) {
    this._db = db;
  }

  // Define a function that inserts favorites into the database
  Future<void> insertFavorite(Favorite favorite) async {
    // Insert the Favorite into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same favorite is inserted twice.
    //
    // In this case, replace any previous data.
    await _db.insert(
      'favorites',
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the favorites from the favorites table.
  Future<List<Favorite>> getFavorites() async {
    // Query the table for all The Favorites.
    final List<Map<String, dynamic>> maps = await _db.query('favorites');

    // Convert the List<Map<String, dynamic> into a List<Favorite>.
    return List.generate(maps.length, (i) {
      return Favorite(
        id: maps[i]['id'],
        data: maps[i]['data'],
      );
    });
  }

  // Define a function that delete favorite from the database
  Future<void> deleteFavorite(Favorite favorite) async {
    await _db.delete('favorites', where: 'id = ?', whereArgs: [favorite.id]);
  }
}
