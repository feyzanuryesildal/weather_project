import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/weatherModel.dart';
import 'package:http/http.dart' as http;

Future<WeatherModel> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=${dotenv.env['API_KEY']}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return WeatherModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

