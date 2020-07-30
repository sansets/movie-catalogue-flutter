import 'db/entity/favorite.dart';

class AppLocalDataSource {
  void saveFavorite(Favorite favorite) {}

  Future<List<Favorite>> getFavorites() {}

  void deleteFavorite(Favorite favorite) {}
}
