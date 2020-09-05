import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx_sample_app/src/model/character_data_wrapper.dart';
import 'package:mobx_sample_app/src/util/constants.dart';
import 'package:mobx_sample_app/src/util/keys.dart';

class Api {
  Future<CharacterDataWrapper> getData(ts, hash, {limit = 20}) async {
    var url =
        "${Constants.BASE_URL}characters?limit=$limit&apikey=${Keys.PUBLIC}&ts=$ts&hash=$hash";

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var parsedJson = json.decode(response.body);
        return CharacterDataWrapper.fromJson(parsedJson);
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
