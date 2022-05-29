import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp/pages/camera.dart';

// CameraDescription cameraDesc() {
//   List cameras = [];
//   CameraDescription camDesc;
//   availableCameras().then((value) => cameras = value);
//   camDesc = cameras.first;
//   return camDesc;
// }

// Future<CameraDescription> createCamera() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final cameras = await availableCameras();
//   final firstCamera = cameras.first;

//   return firstCamera;

//   // runApp(
//   //   MaterialApp(
//   //     home: CameraScreen(camera: firstCamera),
//   //   ),
//   // );
// }

Future<void> createCamera() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();

  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: CameraScreen(
        camera: firstCamera,
      ),
    ),
  );
}
