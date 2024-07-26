import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';

late List<CameraDescription> _cameras;

Future<void> initializeCameras() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  debugPrint('Cameras initialized: ${_cameras.length}');
}

class CameraView extends StatefulWidget {
  CameraView({Key? key}) : super(key: key);

  @override
  CameraViewState createState() => CameraViewState();
}

class CameraViewState extends State<CameraView> {
  CameraController? controller;
  bool _isDetecting = false;
  List<String> _detectedObjectNames = [];

  @override
  void initState() {
    super.initState();
    initializeCamera();
    _initTensorFlow();
  }

  Future<void> _objectRecognition(CameraImage cameraImage) async {
    debugPrint('Running object recognition...');
  
    try {
      var bytesList = cameraImage.planes.map((plane) {
        return plane.bytes;
      }).toList();
    
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
    
      if (recognitions != null && recognitions.isNotEmpty) {
        debugPrint('Recognitions: $recognitions');
        for (var recognition in recognitions) {
          if (recognition['detectedClass'] != null) {
            _detectedObjectNames.add(recognition['detectedClass']);
          }
        }
      } else {
        debugPrint('No recognitions detected.');
      }
    
    } catch (e) {
      debugPrint('Error during object recognition: $e');
    }
  }

  void startObjectDetection() {
    if (controller == null || !controller!.value.isInitialized) {
      debugPrint('CameraController is not initialized.');
      return;
    }

    setState(() {
      _isDetecting = true;
    });
    
    controller!.startImageStream((image) {
      if (_isDetecting) {
        _objectRecognition(image);
      }
    });

    // Stop object detection after 15 seconds
    Future.delayed(Duration(seconds: 15), stopObjectDetection);
  }

  void stopObjectDetection() {
    if (controller == null || !controller!.value.isInitialized) {
      debugPrint('CameraController is not initialized.');
      return;
    }

    setState(() {
      _isDetecting = false;
    });
    controller!.stopImageStream();
    debugPrint('Detected objects: $_detectedObjectNames');
  }

  Future<void> initializeCamera() async {
    try {
      debugPrint('Initializing camera...');
      controller = CameraController(_cameras[0], ResolutionPreset.high);
      await controller!.initialize();

      if (!mounted) {
        return;
      }

      setState(() {});
      debugPrint('Camera initialized.');
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    debugPrint('Disposing camera controller...');
    controller?.dispose();
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
    if (controller == null || !controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return CameraPreview(controller!);
  }
}
