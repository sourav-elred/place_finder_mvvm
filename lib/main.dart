import 'package:flutter/material.dart';
import 'package:place_finder_mvvm/home_page.dart';
import 'package:place_finder_mvvm/view_models/place_list_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => PlaceListViewModel(),
        child: const HomePage(),
      ),
    );
  }
}
