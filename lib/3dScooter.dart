import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class ScooterView extends StatefulWidget {
  @override
  _ScooterView createState() => new _ScooterView();
}

class _ScooterView extends State<ScooterView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Model Viewer")),
        body: ModelViewer(
          src: 'assets/models/scuuter.glb',
          alt: "A 3D model of a scuuter",
          ar: true,
          autoRotate: true,
          cameraControls: true,
        ),
      ),
    );
  }
}