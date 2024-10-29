import 'dart:async';
import 'dart:developer';


import 'package:flutter/widgets.dart';
import 'package:my_flutter/repository/boardRepository.dart';

import '../model/board.dart';

class BoardViewModel with ChangeNotifier {
  late final BoardRepository _boardRepository;
  List<Articles> _boardItems = List.empty(growable: true);
  List<Articles> get boardItems => _boardItems;

  BoardViewModel() {
    print("init");
    _boardRepository = BoardRepository();
    load();
  }

  Future<void> load() async {
    print("load");
    _boardItems = await _boardRepository.load();
    notifyListeners();
  }

  void shuffle() {
    print("shuffle");
    _boardItems.shuffle();
    notifyListeners();
  }
}
