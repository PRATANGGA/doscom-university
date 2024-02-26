import 'package:dico1/provider/product_data.dart';
import 'package:flutter/material.dart';
import 'package:dico1/pages/main_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductData(),
      child: MaterialApp(
        title: 'Wisata Bandung',
        theme: ThemeData(),
        home: const MainScreen(),
      ),
    );
  }
}
