import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weather_project/services/location_services.dart';
import 'package:weather_project/util/icon.dart';
import 'package:weather_project/util/weather_icon.dart';
import 'package:http/http.dart'as http;
import '../models/weatherModel.dart';
import '../services/data_serviices.dart';

import 'dart:ui';






class mainScreenView extends StatefulWidget {
  const mainScreenView({Key? key}) : super(key: key);

  @override
  State<mainScreenView> createState() => _mainScreenViewState();
}

class _mainScreenViewState extends State<mainScreenView> {
  String country = '';
  String adminArea = '';
  late final displayDate;
  var sizeH,sizeW,size;
  CustomIcon customIcon = CustomIcon();
  late Future<WeatherModel> futureAlbum;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    print("${userLocation.lat},${userLocation.long}");

    var date = DateTime.now();
    displayDate = DateFormat('EEEE, MMM d').format(date);
    futureAlbum = fetchAlbum();
  }


  Future<void> getLocation() async {
    List<Placemark> placeMark= await placemarkFromCoordinates(userLocation.lat, userLocation.long);
    setState(() {
      country = placeMark[0].country.toString();
      adminArea = placeMark[0].administrativeArea.toString();


    });
  }

  translateDer  (double? temp) {
    return (temp! - 273.15).toInt().toString();
  }
  @override
  Widget build(BuildContext context) {
    sizeH = MediaQuery.of(context).size.height*0.02;
    sizeW = MediaQuery.of(context).size.width*0.02;
    size = MediaQuery.of(context).size;

    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffffeebcf),
        elevation: 0,
        leading: IconButton( //menu icon button at start left of appbar
          onPressed: (){
            print('search butonuna tıklandı!');

          },
          icon: customIcon.customSearchBarIcon,
        ),
        actions: [
          IconButton(onPressed: (){}, icon: customIcon.customMenuBarIcon),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xfffffeebcf),
              Color(0xfffffde6cb),
              Color(0xfffffddec0),
              Color(0xfffffecda5),
              Color(0xfffffec08d),
              Color(0xfffffebd81),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child:FutureBuilder<WeatherModel>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return  Center(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(),
                    Padding(padding: EdgeInsets.all( 20.0),child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${country},',style: TextStyle(fontSize: 30),),
                        Text('${adminArea}',style: TextStyle(fontSize: 20),),
                        SizedBox(
                          height: sizeH,
                        ),
                        Text('${displayDate}',style: TextStyle(color: Colors.grey),),
                        Row(
                          children: [

                            Container(
                                height: size.height*0.3,
                                width: size.width*0.5,

                                child: weatherIcon.weatherSaturation(snapshot.data!.weather![0].icon.toString()),),

                            SizedBox(
                              width: sizeW*5,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: sizeH*3,
                                    ),
                                    Text('${ translateDer(snapshot.data!.main!.temp!)}',style: TextStyle(fontSize: 30),),
                                    Column(
                                      children: [

                                        Text('°C',style: TextStyle(fontSize: 20,color: Colors.grey), ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                Text("${snapshot.data!.weather![0].main.toString()}",style: TextStyle(fontSize: 15),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: sizeH*2,
                        ),
                        IconCard(deger: '${translateDer(snapshot.data!.main!.feelsLike)}',icon: Icon(Icons.wash_sharp),string: "Feels Like"),
                        IconCard(deger: '${snapshot.data!.wind!.speed.toString()}',icon: Icon(Icons.wind_power),string: "Speed      "),
                        IconCard(deger: '${snapshot.data!.clouds!.all.toString()}',icon: Icon(Icons.cloud_outlined),string: "Clouds"),


                      ],
                    ),

                    ),

                  ],
                ),
              );

            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),



      ),
    );
  }
}

 translateDer  (double? temp) {

  return (temp! - 273.15).toInt().toString();
}



class IconCard extends StatefulWidget {
  IconCard({required this.deger, required this.string, required this.icon});
  final String deger;
  final String string;
  final Icon icon;
  @override
  State<IconCard> createState() => _IconCardState();
}

class _IconCardState extends State<IconCard> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration:  BoxDecoration(
        border: Border.all(
        color: Colors.transparent,
        width: 5,
    ),
    borderRadius: BorderRadius.circular(10),),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
        child: Center(
          child: Card(
            elevation: 0,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white.withOpacity(0.5),
            child:  SizedBox(
              width: 300,
              height: 60,
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,

                      child:
                      widget.icon,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("${widget.string}"),
                    SizedBox(
                      width: 130,
                    ),
                    Text("${widget.deger}"),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


