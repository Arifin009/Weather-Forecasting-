import 'dart:convert';
import 'package:weather_forcasting/Model/WeatherModel.dart';
import 'package:weather_forcasting/constant/ApiUrl.dart';
import 'package:http/http.dart';

class ApiService {
  Future<WeatherModel> fetchWeatherData(String searchKey) async {
    final weatherApi = ApiUrl();

    final String location = searchKey;
    final url = weatherApi.buildUrl(location);
    try {
      Response response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Successful response, parse the JSON data
        final Map<String, dynamic> data = jsonDecode(response.body);

        return WeatherModel.fromJson(data);
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
