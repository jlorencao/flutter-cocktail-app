import 'package:cocktail_app/model/favorite_drinks_hive_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteDrinksHiveModelAdapter());
  await Hive.openBox('favorites');
  runApp(const MyApp());
}
