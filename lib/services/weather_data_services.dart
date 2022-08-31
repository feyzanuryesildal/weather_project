import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_project/models/weatherModel.dart';

import 'location_services.dart';

Future<WeatherModel> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${userLocation.lat}&lon=${userLocation.long}&appid=${dotenv.env['API_KEY']}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("Sorun yok! -> fetch album");
    print(jsonDecode(response.body));
    return WeatherModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

