import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class MainBox extends StatelessWidget {
  String place, temp, sky;
  MainBox(this.place, this.temp, this.sky);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GlassContainer.clearGlass(
      alignment: Alignment.center,
      height: height / 2.5,
      width: width / 1.3,
      borderWidth: 0,
      blur: 2,
      elevation: 20,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text("     " + place + "     ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w500)),
          ),
          Text("Temperature",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w300)),
          Text(temp + '°C',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900)),
          Text("Sky",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w300)),
          Text(sky,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}
