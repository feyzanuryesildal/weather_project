import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_project/models/weatherModel.dart';

class WeatherIcon {
    final clearSky = Lottie.network('https://assets2.lottiefiles.com/packages/lf20_i7ixqfgx.json');
    final fewClouds = Lottie.network('https://assets6.lottiefiles.com/packages/lf20_mwnl7iyc.json');
    final scatteredClouds = Lottie.network('https://assets6.lottiefiles.com/temp/lf20_VAmWRg.json');
    final brokenClouds = Lottie.network('https://assets7.lottiefiles.com/temp/lf20_ZCwXJD.json');
    final showerRain = Lottie.network('https://assets3.lottiefiles.com/temp/lf20_JA7Fsb.json');
    final rain = Lottie.network('https://assets3.lottiefiles.com/temp/lf20_rpC1Rd.json');
    final thunderstorm = Lottie.network('https://assets3.lottiefiles.com/temp/lf20_XkF78Y.json');
    final snow = Lottie.network('https://assets10.lottiefiles.com/temp/lf20_WtPCZs.json');
    final mist = Lottie.network('https://assets7.lottiefiles.com/temp/lf20_kOfPKE.json');

     LottieBuilder weatherSaturation  (String id){
         print(id);
        switch(id){
            case '01d':
                return clearSky;
                break;
            case '02d':
                return fewClouds;
                break;
            case '03d':
                return scatteredClouds;
                break;
            case '04d':
                return brokenClouds;
                break;
            case '09d':
                return showerRain;
                break;
            case '10d':
                return rain;
                break;
            case '11d':
                return thunderstorm;
                break;
            case '13d':
                return snow;
                break;
            case '50d':
                return mist;
                break;
            default:
                clearSky;

        }

         switch(id){
             case '01n':
                 return clearSky;
                 break;
             case '02n':
                 return fewClouds;
                 break;
             case '03n':
                 return scatteredClouds;
                 break;
             case '04n':
                 return brokenClouds;
                 break;
             case '09n':
                 return showerRain;
                 break;
             case '10n':
                 return rain;
                 break;
             case '11n':
                 return thunderstorm;
                 break;
             case '13n':
                 return snow;
                 break;
             case '50n':
                 return mist;
                 break;
             default:
                 clearSky;

         }

        return clearSky;

    }
}

WeatherIcon weatherIcon = WeatherIcon();