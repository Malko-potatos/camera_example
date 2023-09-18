import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_input/display.dart'; // 캡처된 이미지를 표시하는 위젯을 가져옵니다.

class CameraPreviewScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraPreviewScreen({super.key, required this.camera});

  @override
  CameraPreviewScreenState createState() => CameraPreviewScreenState();
}

class CameraPreviewScreenState extends State<CameraPreviewScreen> {
  CameraController? controller;
  Future<void>? initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    initializeControllerFuture = controller!.initialize();
  }

  // 이미지를 캡처하는 메서드입니다.
  void _captureImage() async {
    try {
      final image = await controller!.takePicture();
      _navigateToDisplayPictureScreen(image.path);
    } catch (e) {
      print(e);
    }
  }

  // 캡처된 이미지를 표시하는 화면으로 이동하는 메서드입니다.
  void _navigateToDisplayPictureScreen(String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayPictureScreen(imagePath: imagePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera Preview')),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(controller!);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: _captureImage, // 버튼을 누르면 이미지를 캡처합니다.
                child: const Icon(Icons.camera),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
