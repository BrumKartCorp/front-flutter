import 'package:brum_kart/helloworld.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class ScooterView extends StatefulWidget {
  @override
  _ScooterView createState() => new _ScooterView();
}

class _ScooterView extends State<ScooterView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Color greenBackgroundColor = Colors.black;
    Color redBackgroundColor = Colors.black;
    Color flowerBackgroundColor = Colors.black;

    String selectedColor = "";

    ModelViewer md = ModelViewer(
      src: 'assets/models/scuuter.glb',
      alt: "A 3D model of a scuuter",
      autoRotate: true,
      cameraControls: true,
      backgroundColor: Colors.blueAccent,
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/mk8-background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: height * 0.70,
              child: md,
            ),
            Container(
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            greenBackgroundColor = Colors.amber;

                            redBackgroundColor = Colors.black;
                            flowerBackgroundColor = Colors.black;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.orange,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: greenBackgroundColor
                            ),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage("assets/images/vert.jpg"),
                                    height: 50,
                                  ),
                                  Center(
                                      child: RichText(
                                    text: TextSpan(
                                      text: "Vert\n120 pièces",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            redBackgroundColor = Colors.amber;

                            greenBackgroundColor = Colors.black;
                            flowerBackgroundColor = Colors.black;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.orange,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: redBackgroundColor
                            ),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage("assets/images/rouge.jpg"),
                                    height: 50,
                                  ),
                                  Center(
                                      child: RichText(
                                    text: TextSpan(
                                      text: "Rouge\n130 pièces",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            flowerBackgroundColor = Colors.amber;

                            greenBackgroundColor = Colors.black;
                            redBackgroundColor = Colors.black;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.orange,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: flowerBackgroundColor
                            ),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage(
                                        "assets/images/motif-a-fleurs.jpg"),
                                    height: 50,
                                  ),
                                  Center(
                                      child: RichText(
                                    text: TextSpan(
                                      text: "Fleur\n300 pièces",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))
                                ]),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.only(right: 8, bottom: 12),
                child: FloatingActionButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelloWorld()),
                    );
                  },
                  child : arImage(),

                ),
                height: 50,
                width: 50,
              ),
            )
          ],
        ),
      ),
    );
  }

  arImage() => CircleAvatar(
    radius: 110,
    backgroundImage: AssetImage('assets/images/ar.png'),
    backgroundColor: Colors.white,
  );
}

