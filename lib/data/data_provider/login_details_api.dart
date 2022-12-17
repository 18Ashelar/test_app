import 'dart:convert';
import 'dart:developer';

import 'package:test_app/data/model/login/login_data.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/data/model/map_data/geo_data.dart';

class LoginDetailsApi {
  //User Login
  Future<LoginData> getLoginDetails(String username, String password) async {
    String url = "https://api.terrablender.com/terraprocess/api/v2/open/login";
    Map data = {
      'username': username,
      'passcode': password,
    };
    String body = json.encode(data);
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    log(response.body);
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = LoginData.fromJson(decode);
      log(data.session_token.toString());
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<List<GeoData>> getMapData(String token) async {
    String url =
        "https://api.terrablender.com/terraprocess/api/v2/sys/data/lattest_excavation?geo=true";

    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authentication": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      Iterable l = decode;
      List<GeoData> geoData =
          List<GeoData>.from(l.map((model) => GeoData.fromJson(model)));
      return geoData;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
