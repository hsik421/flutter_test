import 'package:flutter/material.dart';
import 'package:my_flutter/view/boardView.dart';
import 'package:my_flutter/view/swipeView.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
      ),
      body: Column(
        children: [
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BoardView()));
          }, child: const Text("board")),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SwipeView()));
          }, child: const Text("pager"))
        ],
      ),
    );
  }
}
