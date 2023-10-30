import 'package:hive/hive.dart';

part 'favorite_drinks_hive_model.g.dart';

@HiveType(typeId: 1)
class FavoriteDrinksHiveModel extends HiveObject {
  @HiveField(0)
  String idDrink = "";

  @HiveField(1)
  String strDrink = "";

  @HiveField(2)
  String strDrinkThumb = "";

  FavoriteDrinksHiveModel();

  FavoriteDrinksHiveModel.create(
      this.idDrink, this.strDrink, this.strDrinkThumb);
}
