import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_project/models/weatherModel.dart';

class WeatherIcon {
    final clearSky = Lottie.network('https://assets1.lottiefiles.com/temp/lf20_Stdaec.json');
    final fewClouds = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_dgjK9i.json');
    final scatteredClouds = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_dgjK9i.json');
    final brokenClouds = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_Kuot2e.json');
    final showerRain = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_rpC1Rd.json');
    final rain = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_XkF78Y.json');
    final thunderstorm = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_XkF78Y.json');
    final snow = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_BSVgyt.json');
    final mist = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_HflU56.json');

    final clearSkyN = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_y6mY2A.json');
    final fewCloudsN = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_Jj2Qzq.json');
    final scatteredCloudsN = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_Jj2Qzq.json');
    final brokenCloudsN = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_Kuot2e.json');
    final showerRainN = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_I5XMi9.json');
    final rainN = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_XkF78Y.json');
    final thunderstormN = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_XkF78Y.json');
    final snowN = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_RHbbn6.json');
    final mistN = Lottie.network('https://assets2.lottiefiles.com/temp/lf20_HflU56.json');

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
                 return clearSkyN;
                 break;
             case '02n':
                 return fewCloudsN;
                 break;
             case '03n':
                 return scatteredCloudsN;
                 break;
             case '04n':
                 return brokenCloudsN;
                 break;
             case '09n':
                 return showerRainN;
                 break;
             case '10n':
                 return rainN;
                 break;
             case '11n':
                 return thunderstormN;
                 break;
             case '13n':
                 return snowN;
                 break;
             case '50n':
                 return mistN;
                 break;
             default:
                 clearSkyN;

         }

        return clearSkyN;

    }
}

WeatherIcon weatherIcon = WeatherIcon();