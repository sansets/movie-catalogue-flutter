import 'package:flutter/cupertino.dart';
import 'package:movie_catalogue/data/local/app_database.dart';
import 'package:movie_catalogue/data/local/app_local_data_source.dart';

import 'db/entity/favorite.dart';

class AppLocalDataSourceImpl extends AppLocalDataSource {
  AppDatabase _db;

  AppLocalDataSourceImpl({@required AppDatabase db}) {
    this._db = db;
  }

  @override
  void saveFavorite(Favorite favorite) async {
    final favoriteDao = await _db.favoriteDao();
    favoriteDao.insertFavorite(favorite);
  }

  @override
  Future<List<Favorite>> getFavorites() async {
    final favoriteDao = await _db.favoriteDao();
    return favoriteDao.getFavorites();
  }

  @override
  void deleteFavorite(Favorite favorite) async {
    final favoriteDao = await _db.favoriteDao();
    favoriteDao.deleteFavorite(favorite);
  }
}