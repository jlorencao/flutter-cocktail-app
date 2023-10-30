import 'package:flutter/material.dart';

import '../pages/cocktail_details_page.dart';
import 'cocktail_card.dart';

class CocktailListView extends StatefulWidget {
  final drinkList;
  final VoidCallback? onReturn;

  const CocktailListView({super.key, required this.drinkList, this.onReturn});

  @override
  State<CocktailListView> createState() => _CocktailListViewState();
}

class _CocktailListViewState extends State<CocktailListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.drinkList.length,
        itemBuilder: (BuildContext bc, int index) {
          var drink = widget.drinkList[index];
          return CocktailCard(
            favoriteIconFilled: false,
            cardText: drink.strDrink,
            imageUrl: drink.strDrinkThumb,
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DrinkDetailsPage(
                            drinkID: drink.idDrink,
                          )));
              widget.onReturn;
              setState(() {});
            },
          );
        });
  }
}
