import 'package:cocktail_app/pages/cocktail_list_page.dart';
import 'package:cocktail_app/pages/favorites_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageController = PageController(initialPage: 0);
  var pagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(bottom: kBottomNavigationBarHeight * 0.5),
          child: PageView(
              onPageChanged: (value) {
                setState(() {
                  pagePosition = value;
                });
              },
              controller: pageController,
              children: const [CocktailListPage(), FavoritesPage()]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(218, 206, 148, 253),
          onTap: (index) {
            pageController.jumpToPage(index);
          },
          currentIndex: pagePosition,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Cerca",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
              ),
              label: "Preferiti",
            ),
          ],
        ),
      ),
    );
  }
}
