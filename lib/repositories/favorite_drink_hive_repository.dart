import 'package:cocktail_app/model/favorite_drinks_hive_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteDrinkHiveRepository {
  static late Box _box;
  List<FavoriteDrinksHiveModel> favorites = [];

  FavoriteDrinkHiveRepository._create();

  static Future<FavoriteDrinkHiveRepository> getBox() async {
    if (Hive.isBoxOpen('favorites')) {
      _box = Hive.box('favorites');
    } else {
      await Hive.openBox('favorites');
    }
    return FavoriteDrinkHiveRepository._create();
  }

  void addDrinkAsFavorite(FavoriteDrinksHiveModel favoriteDrink) {
    _box.add(favoriteDrink);
  }

  Future<void> deleteDrinkFromFavorite(var key) async {
    await _box.delete(key);
  }

  List<FavoriteDrinksHiveModel> getFavoriteList() {
    favorites = _box.values.cast<FavoriteDrinksHiveModel>().toList();

    return favorites;
  }

  int? controlFavorite(String idDrink) {
    for (var item in favorites) {
      if (item.idDrink == idDrink) {
        return item.key;
      }
    }
    return null;
  }
}
