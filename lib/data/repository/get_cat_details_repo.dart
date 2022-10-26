import 'dart:convert';
import 'package:catapp/data/model/cat_model.dart';
import 'package:http/http.dart' as http;

Future<List<Cat>> getcatDetails() async {
  List<Cat> listData = [];
  var url = 'https://api.thecatapi.com/v1/images/search';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List jsonRes = json.decode(response.body);
    for (var element in jsonRes) {
      Cat model = Cat.fromJson(element);
      listData.add(model);
    }
    // listData = jsonRes.map((e) => Cat.fromJson(e)).toList();
    return listData;
  } else {
    throw Exception('Could not get cat details');
  }
}
