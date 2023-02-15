import 'package:flutter/material.dart';
import 'package:weather/About.dart';

class AppTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Wea-ther",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 40),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
            child: Container(
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  Text(
                    "About",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
