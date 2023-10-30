import 'dart:convert';

import 'package:cocktail_app/model/drink_class.dart';
import 'package:http/http.dart' as http;

class CocktailRepository {
  static const baseUrl = "https://www.thecocktaildb.com/api/json/v1/1";

  static var singleDrink;

  static Future<DrinksModel> getDrinksFromApi(String searchText) async {
    var searchUrl = "$baseUrl/search.php?s=";
    var drinkSearchUrl = "$searchUrl$searchText";

    //Call the API endpoint with searchtText
    final uri = Uri.parse(drinkSearchUrl);
    final response = await http.get(uri);

    //get the json from response
    final jsonString = response.body;
    final responseMap = jsonDecode(jsonString);
    final drinkList = DrinksModel.fromJson(responseMap);

    //return the Drink list
    return drinkList;
  }

  static Future<Drink> getSingleDrinkFromApi(String idDrink) async {
    var singleDrinkUrl = "$baseUrl/lookup.php?i=$idDrink";

    //Call the API endpoint with searchtText
    final uri = Uri.parse(singleDrinkUrl);
    final response = await http.get(uri);

    //get the json from response
    final jsonString = response.body;
    final responseMap = jsonDecode(jsonString);
    final drinkDetails = DrinksModel.fromJson(responseMap);
    singleDrink = drinkDetails.drinks.single;

    //return the Drink list
    return singleDrink;
  }
}
