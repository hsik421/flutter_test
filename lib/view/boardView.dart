import 'package:flutter/material.dart';
import 'package:my_flutter/viewmodel/boardViewModel.dart';
import 'package:provider/provider.dart';

class BoardView extends StatefulWidget {
  const BoardView({super.key});

  @override
  State createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BoardViewModel(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Board"),
            backgroundColor: Colors.green,
          ),
          body: Consumer<BoardViewModel>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          TextButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.blueAccent)),
                              child: const Text("shuffle"),
                              onPressed: () {
                                provider.shuffle();
                              }),
                          const Padding(
                            padding: EdgeInsets.all(10),
                          ),
                        ],
                      )),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: provider.boardItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            leading: Image.network(
                              provider.boardItems[index].urlToImage ?? "",
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return const Text('이미지를 불러올 수 없습니다.');
                              },
                            ),
                            title: Text(
                                "${provider.boardItems[index].description}"));
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }
}
