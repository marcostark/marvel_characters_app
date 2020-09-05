import 'package:mobx/mobx.dart';

import 'package:mobx_sample_app/src/data/api.dart';
import 'package:mobx_sample_app/src/model/character_data_wrapper.dart';
import 'package:mobx_sample_app/src/util/keys.dart';
import 'package:mobx_sample_app/src/util/util.dart';

part 'characters_list.g.dart';

class CharactersList = CharacterBase with _$CharactersList;

Api api = Api();

abstract class CharacterBase with Store {
  @observable
  Future<CharacterDataWrapper> characters;

  @action
  fetchData() {
    var timeStamp = DateTime.now().millisecondsSinceEpoch;
    var hash = Util.generateMd5("$timeStamp");
    characters = getData(timeStamp, hash);
  }
}

Future<CharacterDataWrapper> getData(ts, hash) async {
  return api.getData(ts, hash).asObservable();
}
