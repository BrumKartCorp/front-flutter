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
              child: ModelViewer(
                src: 'assets/models/scuuter.glb',
                alt: "A 3D model of a scuuter",
                autoRotate: true,
                cameraControls: true,
                backgroundColor: Colors.blueAccent,
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: Colors.black
                          ),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image(
                                  image:
                                  AssetImage("assets/images/vert.jpg"),
                                  height: 50,
                                ),
                                Center(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Vert",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                )
                              ]),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: Colors.black
                          ),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image(
                                  image:
                                  AssetImage("assets/images/rouge.jpg"),
                                  height: 50,
                                ),
                                Center(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Rouge",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                )
                              ]),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                             color: Colors.black
                          ),
                          child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image(
                                    image:
                                    AssetImage("assets/images/motif-a-fleurs.jpg"),
                                    height: 50,
                                  ),
                                  Center(
                                      child: RichText(
                                        text: TextSpan(
                                          text: "Fleurs",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                  )
                                ]),
                          ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
