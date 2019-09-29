import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

const apiKey = "5708c611b181d76520b5da88125944f3";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location loc;
  @override
  void initState() {
    super.initState();
    getLoc();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }

  void getLoc() async {
    loc = Location();
    await loc.getLocation();
    print("Latitude: ${loc.getLat()},\nLongitude:${loc.getLong()}");
  }

  void getData() async {
    Response rp = await get(
        "https://api.openweathermap.org/data/2.5/weather?lat=${loc.getLat()}&lon=${loc.getLong()}&appid=$apiKey");
    if (rp.statusCode == 200) {
      var data = jsonDecode(rp.body);
      var temperature = data["main"]["temp"];
      var condition = data["weather"][0]["id"];
      String cityName = data["name"];
    } else {
      print(rp.statusCode);
    }
  }
}
