import 'package:cocktail_app/model/drink_class.dart';
import 'package:cocktail_app/repositories/cocktail_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/cocktail_list_view.dart';

class CocktailListPage extends StatefulWidget {
  const CocktailListPage({super.key});

  @override
  State<CocktailListPage> createState() => _CocktailListPageState();
}

class _CocktailListPageState extends State<CocktailListPage> {
  var drinksModel = DrinksModel([]);
  List<Drink> drinksList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(100, 245, 245, 245),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Cocktails",
                  style: GoogleFonts.cookie(
                      fontSize: 60, fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: "Cerca un Cocktail",
                        suffixIcon: Icon(
                          Icons.search,
                          size: 26,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0)))),
                    onChanged: (value) async {
                      drinksModel =
                          await CocktailRepository.getDrinksFromApi(value);
                      drinksList = drinksModel.drinks;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                (drinksModel.drinks.isEmpty)
                    ? const Text(
                        "Drink non trovato. Inserisci un nuovo nome da cercare")
                    : Expanded(child: CocktailListView(drinkList: drinksList))
              ],
            ),
          )),
    );
  }
}
