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
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.70,
            child: ModelViewer(
              src: 'assets/models/scuuter.glb',
              alt: "A 3D model of a scuuter",
              autoRotate: true,
              cameraControls: true,
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/bleu.jpg"),
                            height: 50,
                          ),
                          Center(child: Text("Bleu"))
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/rouge.jpg"),
                            height: 50,
                          ),
                          Center(child: Text("Rouge"))
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image(
                            image:
                            AssetImage("assets/images/vert.jpg"),
                            height: 50,
                          ),
                          Center(child: Text("Vert"))
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image(
                            image:
                            AssetImage("assets/images/motif-a-fleurs.jpg"),
                            height: 50,
                          ),
                          Center(child: Text("Motif à fleurs"))
                        ]),
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
