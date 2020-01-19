import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx_sample_app/src/model/character.dart';
import 'package:mobx_sample_app/src/util/keys.dart';

class Api {
  static Future<Character> getData(ts, hash) async {
    var url =
        "https://gateway.marvel.com:443/v1/public/characters?limit=5&apikey=${Keys.PUBLIC}&ts=$ts&hash=$hash";

    print('Url => ${url}');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var parsedJson = json.decode(response.body);
        //print('Characters List => ${parsedJson.toString()}');
        return Character.fromJson(parsedJson);
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
