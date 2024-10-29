import 'package:flutter/material.dart';
import 'package:my_flutter/AppScrollBehavior.dart';

class SwipeView extends StatefulWidget {
  const SwipeView({super.key});

  @override
  State createState() {
    return _SwipeViewState();
  }
}

class _SwipeViewState extends State<SwipeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Pager"), backgroundColor: Colors.amberAccent),
      body: PageView.builder(
        itemCount: 3,
        onPageChanged: (value) {},
        scrollBehavior: AppScrollBehavior(),
        itemBuilder: (context, index) {
          return Container(
              color: Colors.orange,
              child: Center(
                child: Text("$index"),
              ));
        },
      ),
    );
  }
}
