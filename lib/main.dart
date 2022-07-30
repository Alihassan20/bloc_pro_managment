import 'package:bloc_pro_managment/const/new_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/character_screen/character_cubit.dart';
import 'feature/character_screen/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CharacterScreenView(),
    );
  }
}