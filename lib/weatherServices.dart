import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:weather_project/weatherModel.dart';

class WeatherService {
  final String url = "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=df6e9f46b79bf986b59a142395994088";
  Future<WeatherModel?>fetchUsers()async{
    var res = await http.get(Uri.parse(url));
    if(res.statusCode ==200){
      var jsonBody = WeatherModel.fromJson(jsonDecode(res.body));
      print(jsonBody);
      return jsonBody;
    } else {
      print("istek başarısız oldu => ${res.statusCode}");
    }
  }
}