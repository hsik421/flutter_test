import 'package:flutter/material.dart';
import 'package:my_flutter/AppScrollBehavior.dart';
import 'package:my_flutter/view/boardView.dart';
import 'package:my_flutter/view/mainView.dart';
import 'package:my_flutter/viewmodel/boardViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainView()
    );
  }
}

