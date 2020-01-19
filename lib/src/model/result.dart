import 'package:mobx_sample_app/src/model/thumbnail.dart';

class Result {
  int id;
  String name;
  String description;
  Thumbnail thumbnail;

  Result({this.id, this.name, this.description, this.thumbnail});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
