import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weather_project/services/location_services.dart';
import 'package:weather_project/util/icon.dart';

import '../models/weatherModel.dart';
import '../services/data_serviices.dart';

class mainScreenView extends StatefulWidget {
  const mainScreenView({Key? key}) : super(key: key);

  @override
  State<mainScreenView> createState() => _mainScreenViewState();
}

class _mainScreenViewState extends State<mainScreenView> {
  String country = '';
  String adminArea = '';
  late final displayDate;
  var sizeH,sizeW;
  CustomIcon customIcon = CustomIcon();
  late Future<WeatherModel> futureAlbum;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    var date = DateTime.now();
    displayDate = DateFormat('EEEE, MMM d').format(date);
    futureAlbum = fetchAlbum();

  }



  Future<void> getLocation() async {
    List<Placemark> placeMark= await placemarkFromCoordinates(UserLocation.lat, UserLocation.long);
    setState(() {
      country = placeMark[0].country.toString();
      adminArea = placeMark[0].administrativeArea.toString();

    });
  }
  @override
  Widget build(BuildContext context) {
    sizeH = MediaQuery.of(context).size.height*0.02;
    sizeW = MediaQuery.of(context).size.width*0.02;
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
        child: Center(
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
                      Icon(Icons.cloud_outlined,size: 200,),
                      SizedBox(
                        width: sizeW*7,
                      ),
                      Column(
                        children: [
                          FutureBuilder<WeatherModel>(
                            future: futureAlbum,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text("${snapshot.data!.main!.temp.toString()}",style: TextStyle(fontSize: 30),);
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              // By default, show a loading spinner.
                              return const CircularProgressIndicator();
                            },
                          ),

                          Text("Rainy",style: TextStyle(fontSize: 30),),
                        ],
                      ),
                    ],
                  ),
                  FutureBuilder<WeatherModel>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return IconCard(deger: snapshot.data!.weather![0].main.toString());
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),


                ],
              ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}

class IconCard extends StatefulWidget {
  IconCard({required this.deger});
  final String deger;
  @override
  State<IconCard> createState() => _IconCardState();
}

class _IconCardState extends State<IconCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 70,
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(Icons.sunny_snowing),
            SizedBox(
              width: 10,
            ),
            Text("${widget.deger}"),
            SizedBox(
              width: 160,
            ),
            Text("3 cm"),

          ],
        ),
      ),
    );
  }
}



