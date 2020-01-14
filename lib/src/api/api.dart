import 'package:http/http.dart' as http;
import 'package:mobx_sample_app/src/model/result.dart';

class Api {
  
  static final String BASE_URL = '';
  static final String PUBLIC_KEY = '';
  static final String SECRET_KEY = '';

  static Future<Result> getData(context) async {
    try {
      final response = await http.get(BASE_URL);

      if (response.statusCode == 200) {
        // Response from json
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
