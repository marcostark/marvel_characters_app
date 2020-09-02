import 'package:mobx/mobx.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

import 'package:http/http.dart' as http;
import 'package:mobx_sample_app/src/model/character_data_wrapper.dart';
import 'package:mobx_sample_app/src/util/keys.dart';

part 'characters_list.g.dart';

class CharactersList = CharacterBase with _$CharactersList;

abstract class CharacterBase with Store {
  @observable
  Future<CharacterDataWrapper> characters;

  @observable
  int charactersLimit = 20;

  @action
  fetchData() {
    var ts = DateTime.now().millisecondsSinceEpoch;
    var hash = generateMd5("$ts" + Keys.PRIVATE + Keys.PUBLIC);
    characters = getData(ts, hash);
  }

  static generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}

Future<CharacterDataWrapper> getData(ts, hash) async {
  var url =
      "https://gateway.marvel.com:443/v1/public/characters?limit=5&apikey=${Keys.PUBLIC}&ts=$ts&hash=$hash";

  print('Url => $url');
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
