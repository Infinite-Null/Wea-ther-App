import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:weather/AppTop.dart';
import 'package:weather/Glass.dart';
import 'package:weather/MianBox.dart';
import 'package:weather/Models/weather.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

Weather data = Weather();

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final value = TextEditingController();
  List<String> weathers_gifs = [
    "./assets/Clear.gif",
    "./assets/Clouds.gif",
    "./assets/Rain.gif",
    "./assets/Snow.gif",
    "./assets/Haze.gif"
  ];

  Weather fake = Weather();
  int feelslike = 0;
  int temp = 0;
  int index = 3;
  int i = 0;
  String? search = "Siliguri";
  Future<Weather> getData() async {
    search = search!.trim();
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=${search}&appid=3045dd712ffe6e702e3245525ac7fa38"));

    var dat = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      data = Weather.fromJson(dat);
      feelslike = (data.main!.feelsLike! - 273).ceil();
      temp = (data.main!.temp! - 273).ceil();
      if (data.weather![0].main.toString() == "Clear") {
        setState(() {
          index = 0;
        });
      } else if (data.weather![0].main.toString() == "Clouds") {
        setState(() {
          index = 1;
        });
      } else if (data.weather![0].main.toString() == "Rain") {
        setState(() {
          index = 2;
        });
      } else if (data.weather![0].main.toString() == "Snow") {
        setState(() {
          index = 3;
        });
      } else if (data.weather![0].main.toString() == "Haze") {
        setState(() {
          index = 4;
        });
      }
      return data;
    } else {
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(61, 0, 0, 0), BlendMode.srcATop),
                  fit: BoxFit.cover,
                  image: AssetImage(weathers_gifs[index]))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppTop(),
              Container(
                padding: EdgeInsets.all(14.0),
                child: TextField(
                  focusNode: FocusNode(canRequestFocus: false),
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          search = value.text.toString();
                          i++;
                        });
                      },
                    ),
                  ),
                  controller: value,
                  onSubmitted: (value) {
                    setState(() {
                      search = value;
                      i++;
                    });
                  },
                ),
              ),
              Expanded(
                child: !(i == 0)
                    ? FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MainBox(data.name.toString(), temp.toString(),
                                    data.weather![0].main.toString()),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Glass(
                                        "Wind",
                                        data.wind!.speed.toString() + " km/h",
                                        2),
                                    Glass(
                                        "Humidity",
                                        data.main!.humidity.toString() + "%",
                                        0),
                                    Glass("Feels Like",
                                        feelslike.toString() + "°C", 1),
                                  ],
                                ),
                              ],
                            );
                          }
                        })
                    : Container(
                        child: Text(
                          "Search for your place",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              )
            ],
          ),
        ));
  }
}
