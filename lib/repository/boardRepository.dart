

import 'package:my_flutter/dataSource/boardDataSource.dart';
import 'package:my_flutter/model/board.dart';

class BoardRepository{
  final BoardDataSource _boardDataSource = BoardDataSource();
  Future<List<Articles>> load() async{
    return _boardDataSource.load();
  }
}