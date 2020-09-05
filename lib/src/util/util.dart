import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

import 'keys.dart';

class Util {
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data + Keys.PRIVATE + Keys.PUBLIC);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
