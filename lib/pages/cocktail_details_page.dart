import 'dart:ui';

import 'package:cocktail_app/component/custom_text.dart';
import 'package:cocktail_app/model/favorite_drinks_hive_model.dart';
import 'package:cocktail_app/repositories/cocktail_repository.dart';
import 'package:cocktail_app/repositories/favorite_drink_hive_repository.dart';
import 'package:flutter/material.dart';

class DrinkDetailsPage extends StatefulWidget {
  final drinkID;
  final VoidCallback? onReturn;

  const DrinkDetailsPage({super.key, required this.drinkID, this.onReturn});

  @override
  State<DrinkDetailsPage> createState() => _DrinkDetailsPageState();
}

class _DrinkDetailsPageState extends State<DrinkDetailsPage> {
  var drinkDetails;
  var ingredients;
  var measures;
  Color textColor = Colors.black;
  FavoriteDrinkHiveRepository? favoritesRepository;
  var favoriteList;
  var isFavorite;
  var itemKey;

  @override
  void initState() {
    getFavoritesDatabase(widget.drinkID);
    getDrinkDetails(widget.drinkID);
    super.initState();
  }

  void getDrinkDetails(String idDrink) async {
    drinkDetails = await CocktailRepository.getSingleDrinkFromApi(idDrink);
    if (drinkDetails != null) {
      ingredients = drinkDetails.ingredients();
      measures = drinkDetails.measures();
    }
    setState(() {});
  }

  void getFavoritesDatabase(String drinkID) async {
    favoritesRepository = await FavoriteDrinkHiveRepository.getBox();
    if (favoritesRepository != null) {
      favoriteList = favoritesRepository!.getFavoriteList();
      itemKey = favoritesRepository!.controlFavorite(drinkID);
      if (itemKey != null) {
        isFavorite = true;
      } else {
        isFavorite = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            scrolledUnderElevation: 0.0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ),
          body: (drinkDetails == null)
              ? const CircularProgressIndicator()
              : Stack(children: [
                  Positioned(
                    top: -20,
                    left: 0,
                    right: 0,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(drinkDetails.strDrinkThumb))),
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            color: Colors.grey.withOpacity(0.1),
                            alignment: Alignment.center,
                            child: Image.network(
                              drinkDetails.strDrinkThumb,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: CustomText(
                                  text: drinkDetails.strDrink,
                                  maxLines: 2,
                                  color: textColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(flex: 1, child: Container()),
                              InkWell(
                                onTap: () {
                                  if (isFavorite) {
                                    favoritesRepository!
                                        .deleteDrinkFromFavorite(itemKey);
                                    getFavoritesDatabase(widget.drinkID);
                                    setState(() {});
                                  } else {
                                    var favorite =
                                        FavoriteDrinksHiveModel.create(
                                            drinkDetails.idDrink,
                                            drinkDetails.strDrink,
                                            drinkDetails.strDrinkThumb);
                                    favoritesRepository
                                        ?.addDrinkAsFavorite(favorite);
                                    getFavoritesDatabase(widget.drinkID);
                                    setState(() {});
                                  }
                                },
                                child: Icon(
                                  (isFavorite)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: textColor,
                                  size: 26,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.only(right: 10),
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Card(
                                        child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomText(
                                              text: "Ingredienti",
                                              color: textColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Flexible(
                                              fit: FlexFit.loose,
                                              child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  primary: false,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: ingredients.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var measure =
                                                        measures[index];
                                                    var ingredient =
                                                        ingredients[index];
                                                    return CustomText(
                                                        text: (measure ==
                                                                "null")
                                                            ? " $ingredient"
                                                            : " $measure $ingredient",
                                                        color: textColor,
                                                        fontSize: 16);
                                                  }),
                                            )
                                          ]),
                                    )),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomText(
                                              text: "Instruzione",
                                              color: textColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Flexible(
                                              fit: FlexFit.loose,
                                              child: CustomText(
                                                text: (drinkDetails
                                                            .strInstructionsIT !=
                                                        null)
                                                    ? "${drinkDetails.strInstructionsIT}"
                                                    : "${drinkDetails.strInstructions}",
                                                color: textColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                ])),
    );
  }
}
