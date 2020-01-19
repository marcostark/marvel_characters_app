import 'package:mobx_sample_app/src/model/data.dart';

class Character {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  Data data;
  String etag;

  Character(
      {this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHTML,
      this.data,
      this.etag});

  Character.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    etag = json['etag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['attributionText'] = this.attributionText;
    data['attributionHTML'] = this.attributionHTML;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['etag'] = this.etag;
    return data;
  }
}
