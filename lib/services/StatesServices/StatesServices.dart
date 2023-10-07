import 'dart:convert';

import 'package:covid_19_trackingapp/model/WorldStatesModel/WorldStatesModel.dart';
import 'package:covid_19_trackingapp/services/ApisURL/apiUrl.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecord() async {
    final response = await http.get(Uri.parse(API_URL.worldStatesApi));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }
}
