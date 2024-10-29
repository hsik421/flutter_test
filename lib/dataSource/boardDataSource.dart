


import 'dart:convert';

import 'package:my_flutter/model/board.dart';
import 'package:http/http.dart' as http;

class BoardDataSource{
  Future<List<Articles>> load() async{
    const params = <String,String>{
      "country" : "us",
      "apiKey" : "aec49dc8469c48848e2ae7e55b7d5d06"
    };
    var uri = Uri.https("newsapi.org","/v2/top-headlines",params);
    var response = await http.get(uri);
    if(response.statusCode == 200){
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      var data = NewsResponse.fromJson(jsonResponse).articles;
      if(data != null){
        return data;
      }
    }
    return List.empty();
  }
}