import 'package:cocktail_app/model/favorite_drinks_hive_model.dart';
import 'package:cocktail_app/repositories/favorite_drink_hive_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/cocktail_card.dart';
import 'cocktail_details_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<FavoriteDrinksHiveModel> favoritesList = [];
  FavoriteDrinkHiveRepository? favoriteDrinkHiveRepository;

  @override
  void initState() {
    getFavorites();
    super.initState();
  }

  void getFavorites() async {
    favoriteDrinkHiveRepository = await FavoriteDrinkHiveRepository.getBox();
    if (favoriteDrinkHiveRepository != null) {
      favoritesList = favoriteDrinkHiveRepository!.getFavoriteList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(100, 245, 245, 245),
            body: (favoritesList.isEmpty)
                ? const Center(
                    child: Text("Insert an Cocktail to your favorites"))
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "I drink del cuore",
                              style: GoogleFonts.cookie(
                                fontSize: 50,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 24.0, left: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.purple.shade900,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.favorite_border_rounded,
                                    color: Colors.purple.shade900,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.favorite_sharp,
                                    color: Colors.purple.shade900,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: favoritesList.length,
                              itemBuilder: (BuildContext bc, int index) {
                                var drink = favoritesList[index];
                                return CocktailCard(
                                  favoriteIconFilled: false,
                                  cardText: drink.strDrink,
                                  imageUrl: drink.strDrinkThumb,
                                  onTap: () {
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DrinkDetailsPage(
                                                        drinkID:
                                                            drink.idDrink)))
                                        .then((value) => getFavorites());
                                    setState(() {});
                                  },
                                );
                              }),
                        ),
                      ],
                    ),
                  )));
  }
}
