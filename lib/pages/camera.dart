import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:superapp/pages/preview.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key, this.camera}) : super(key: key);

  final CameraDescription? camera;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  late CameraController cameraController;
  late Future<void> _initializeControllerFuture;
  var isCameraReady = false;

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    cameraController = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = cameraController.initialize();
    if (!mounted) return;
    setState(() {
      isCameraReady = true;
    });
  }

  @override
  void initState() {
    super.initState();
    initCamera();
    WidgetsBinding.instance.addObserver(this);
    // cameraController = CameraController(firstCamera, ResolutionPreset.high);
    // _initializeControllerFuture = cameraController.initialize();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addObserver(this);
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          return Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CameraPreview(cameraController),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(bottom: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[cameraControl(context)],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.black,
  //     body: FutureBuilder(
  //       future: _initializeControllerFuture,
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           return CameraPreview(cameraController);
  //         } else {
  //           return const Center(child: CircularProgressIndicator());
  //         }
  //       },
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () async {
  //         try {
  //           print('Masuk on pressed');
  //           await _initializeControllerFuture;

  //           final image = await cameraController.takePicture();

  //           Navigator.of(context).push(
  //             MaterialPageRoute(
  //               builder: (context) => PreviewScreen(imgPath: image),
  //             ),
  //           );
  //         } catch (e) {
  //           print(e);
  //         }
  //       },
  //       child: const Icon(Icons.camera_alt),
  //     ),
  //   );
  // }

  Widget cameraControl(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            FloatingActionButton(
              child: const Icon(
                Icons.camera,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              onPressed: () {
                onCapture(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget cameraPreview() {
    var camera = cameraController.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;

    if (scale < 1) scale = 1 / scale;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return Transform.scale(
      scale: scale,
      alignment: Alignment.topCenter,
      child: Center(
        child: CameraPreview(cameraController),
      ),
    );
  }

  onCapture(context) async {
    try {
      await cameraController.takePicture().then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreviewScreen(imgPath: value),
          ),
        );
      });
    } catch (e) {
      showCameraException(e);
    }
  }

  showCameraException(e) {
    String errorText = 'Error ${e.code} \nError message: ${e.description}';
    print(errorText);
  }

  // Widget cameraToggle() {
  //   CameraDescription selectedCamera = widget.camera;
  //   CameraLensDirection lensDirection = selectedCamera.lensDirection;

  //   return Expanded(
  //     child: Align(
  //       alignment: Alignment.centerLeft,
  //       child: TextButton.icon(
  //           onPressed: () {
  //             onSwitchCamera();
  //           },
  //           icon: Icon(
  //             getCameraLensIcon(lensDirection),
  //             color: Colors.white,
  //             size: 24,
  //           ),
  //           label: Text('${lensDirection.toString()}')),
  //     ),
  //   );
  // }
}

// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;

//   const DisplayPictureScreen({Key? key, required this.imagePath})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     print('masuke ke display');
//     return Scaffold(
//       appBar: AppBar(title: const Text('Display the picture')),
//       body: Image.file(File(imagePath)),
//     );
//   }
// }
