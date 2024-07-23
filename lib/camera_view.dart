import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'package:flutter/foundation.dart';

late List<CameraDescription> _cameras;
int _imageCount = 0;

Future<void> initializeCameras() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  debugPrint('Cameras initialized: ${_cameras.length}');
}

class CameraView extends StatefulWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    initializeCamera();
    _initTensorFlow();
  }

  Future<void> _objectRecognition(CameraImage cameraImage) async {
  debugPrint('Running object recognition...');
  
  try {
    // Log camera image details for debugging
    debugPrint('CameraImage details: height=${cameraImage.height}, width=${cameraImage.width}');
    
    var bytesList = cameraImage.planes.map((plane) {
      debugPrint('Plane bytes length: ${plane.bytes.length}');
      return plane.bytes;
    }).toList();
    
    debugPrint('Starting TensorFlow Lite model inference...');
    
    var recognitions = await Tflite.runModelOnFrame(
      bytesList: bytesList,
      imageHeight: cameraImage.height,
      imageWidth: cameraImage.width,
      imageMean: 127.5,
      imageStd: 127.5,
      rotation: 90,
      numResults: 2,
      threshold: 0.1,
      asynch: true,
    );
    
    // Log recognitions or no detection
    if (recognitions != null && recognitions.isNotEmpty) {
      debugPrint('Recognitions: $recognitions');
    } else {
      debugPrint('No recognitions detected.');
    }
    
  } catch (e) {
    // Log the full exception details
    debugPrint('Error during object recognition: $e');
  }
}


  void initializeCamera() async {
    try {
      debugPrint('Initializing camera...');
      controller = CameraController(_cameras[0], ResolutionPreset.high);
      await controller.initialize();

      if (!mounted) {
        return;
      }

      controller.startImageStream((image) {
        _imageCount++;
        if (_imageCount % 10 == 0) {
        _objectRecognition(image);
        }
      });

      setState(() {});
      debugPrint('Camera initialized.');
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    debugPrint('Disposing camera controller...');
    controller.dispose();
    Tflite.close();
    super.dispose();
  }

  Future<void> _initTensorFlow() async {
    try {
      debugPrint('Loading TensorFlow model...');
      await Tflite.loadModel(
        model: "assets/detect.tflite",
        labels: "assets/label_map.pbtxt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false,
      );
      debugPrint('TensorFlow model loaded.');
    } catch (e) {
      debugPrint('Error loading TensorFlow model: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return CameraPreview(controller);
  }
}
