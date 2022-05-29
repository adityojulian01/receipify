import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:superapp/models/auth.dart';
import 'package:superapp/models/core/recipeapi.dart';
import 'package:superapp/models/core/spoon.api.dart';
import 'package:superapp/pages/scan_completion.dart';
import 'package:superapp/utils/app_color.dart';
import 'package:superapp/widgets/navigator_button.dart';

class HomePage extends StatefulWidget {
  // final List<String>? selectedItem;

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late CameraController _controller;
  late Future<void> _initController;
  var isCameraReady = false;
  late XFile imageFile;
  // late List<RecipeAPI> _recipes;
  // bool _isLoading = true;

  // @override
  // void initState() {
  //   super.initState();
  //   getRecipes();
  //   initCamera();
  //   WidgetsBinding.instance.addObserver(this);
  // }

  // Future<void> getRecipes() async {
  //   _recipes = await RecipeApi.getRecipe();
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  void initState() {
    print('user id: $idAuth');
    super.initState();
    initCamera();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _initController =
          _controller != null ? _controller.initialize() : _initController;
      //_initController = _controller.initialize();
    }
    if (!mounted) return;
    setState(() {
      isCameraReady = true;
    });
  }

  Widget cameraWidget(context) {
    var camera = _controller.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;

    if (scale < 1) {
      scale = 1 / scale;
    }

    return Transform.scale(
      scale: scale,
      // alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        child: Center(
          child: CameraPreview(_controller),
        ),
      ),
    );
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initController = _controller.initialize();
    if (!mounted) return;
    setState(() {
      isCameraReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initController,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Container(child: cameraWidget(context)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RawMaterialButton(
                          padding: EdgeInsets.all(15),
                          elevation: 2,
                          fillColor: AppColor.primary,
                          onPressed: () => captureImage(context),
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 25,
                            color: Colors.white,
                            // onPressed: () => captureImage(context),
                            // icon: const Icon(Icons.camera_alt),
                          ),
                        ),
                        RawMaterialButton(
                          padding: EdgeInsets.all(15),
                          elevation: 2,
                          fillColor: AppColor.primary,
                          onPressed: () => _getFromGallery(),
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.image,
                            size: 25,
                            color: Colors.white,
                            // onPressed: () => captureImage(context),
                            // icon: const Icon(Icons.camera_alt),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  captureImage(BuildContext context) {
    _controller.takePicture().then((file) {
      setState(() {
        imageFile = file;
      });
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DisplayPictureScreen(
              image: File(imageFile.path),
              // selectedItem: widget.selectedItem!,
            ),
          ),
        );
      }
    });
  }

  /// Get from gallery
  Future _getFromGallery() async {
    // final ImagePicker _picker = ImagePicker();
    // final imageFile = await _picker.pickImage(source: ImageSource.gallery);

    imageFile = (await ImagePicker().pickImage(source: ImageSource.gallery))!;

    final imageTemporary = XFile(imageFile.path);
    setState(() {
      this.imageFile = imageTemporary;
    });

    if (imageFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            image: File(imageFile.path),
            // selectedItem: widget.selectedItem!,
          ),
        ),
      );
    }

    // if (imageFile != null) {
    //   setState(() {
    //     imageFile = File(pickedFile.path);
    //   });
    // }
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final File image;
  // final List<String> selectedItem;
  //final List<RecipeAPI> recipes;

  const DisplayPictureScreen({
    Key? key,
    required this.image,
    // required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text('Display'),
      ),
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.file(
            image,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                child: Text('Next'),
                onPressed: () async {
                  String result = await SpoonRecipeAPI.extractImage(image);
                  print(result);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ScanCompletion(
                        imageFile: image,
                        scannedItems: result.split(','),
                      ),
                    ),
                  );
                }),
            // child: NavigatorButton(
            //   message: 'Next',
            //   nextPage: ScanCompletion(imageFile: image),
            // ),
          ),
        )
      ]),
    );
  }
}
