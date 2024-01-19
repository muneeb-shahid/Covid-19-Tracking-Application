import 'dart:convert';

import 'package:covid_19_trackingapp/model/world_states_model/world_states_model.dart';
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

  Future<List<dynamic>> fetchCountriesModel() async {
    var data;
    final response = await http.get(Uri.parse(API_URL.worldCountriesApi));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error");
    }
  }
}
