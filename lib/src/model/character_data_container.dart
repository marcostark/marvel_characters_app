import 'package:mobx_sample_app/src/model/character.dart';

class CharacterDataContainer {
  int offset;
  int limit;
  int total;
  int count;
  List<Character> results;

  CharacterDataContainer(
      {this.offset, this.limit, this.total, this.count, this.results});

  CharacterDataContainer.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = List<Character>();
      json['results'].forEach((v) {
        results.add(Character.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
