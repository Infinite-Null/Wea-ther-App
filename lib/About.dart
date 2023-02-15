import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 25,
            )),
        title: Text(
          "About",
          style: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.w200),
        ),
        backgroundColor: Color.fromARGB(74, 0, 0, 0),
      ),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(61, 0, 0, 0), BlendMode.srcATop),
                fit: BoxFit.cover,
                image: AssetImage("./assets/About.gif"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlassContainer.clearGlass(
              height: height / 1.4,
              width: width / 1.3,
              borderWidth: 0,
              blur: 2,
              elevation: 12,
              shadowColor: Colors.black,
              borderRadius: BorderRadius.circular(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child: Column(
                    children: [
                      Text(
                        "Wea-ther",
                        style: TextStyle(
                            fontSize: 40,
                            color: Color.fromARGB(255, 186, 201, 255),
                            fontWeight: FontWeight.w200),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        width: width,
                        height: height / 4.5,
                        child: Text(
                            "No more cancelling of plans because of unpredictable weather.Wea-ther app gives you weather information of all the place around the globe",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Developed By",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 205, 255, 186),
                                  fontWeight: FontWeight.w200),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                      image: AssetImage("./assets/me.jpg"))),
                            ),
                            Text("Ankit Kumar Shah",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Github",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 255, 186, 250),
                                  fontWeight: FontWeight.w200),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                      image:
                                          AssetImage("./assets/github.jpg"))),
                            ),
                            Text("Infinite-Null",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
