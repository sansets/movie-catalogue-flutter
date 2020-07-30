import 'package:flutter/cupertino.dart';
import 'package:movie_catalogue/data/local/app_local_data_source.dart';

import 'local/db/entity/favorite.dart';

class AppRepository extends AppLocalDataSource {
  AppLocalDataSource _appLocalDataSource;

  AppRepository({@required AppLocalDataSource appLocalDataSource}) {
    this._appLocalDataSource = appLocalDataSource;
  }

  @override
  void saveFavorite(Favorite favorite) {
    _appLocalDataSource.saveFavorite(favorite);
  }

  @override
  Future<List<Favorite>> getFavorites() async {
    return _appLocalDataSource.getFavorites();
  }

  @override
  void deleteFavorite(Favorite favorite) async {
    _appLocalDataSource.deleteFavorite(favorite);
  }
}