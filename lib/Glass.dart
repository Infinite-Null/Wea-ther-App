import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class Glass extends StatelessWidget {
  List<String> logo = [
    "./assets/Humidity.gif",
    "./assets/Preasure.gif",
    "./assets/Wind.gif"
  ];
  String title, value;
  int index;
  Glass(this.title, this.value, this.index);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GlassContainer.clearGlass(
      alignment: Alignment.center,
      height: 170,
      width: width / 3.333,
      borderWidth: 0,
      blur: 2,
      elevation: 12,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 70,
            margin: EdgeInsets.fromLTRB(12, 10, 12, 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(logo[index]))),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: FittedBox(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
