import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// 카메라 프리뷰를 표시하는 위젯입니다.
class CameraPreviewScreen extends StatefulWidget {
  // 사용할 카메라의 설명입니다.
  final CameraDescription camera;

  // 생성자에서 카메라 설명을 받아옵니다.
  const CameraPreviewScreen({super.key, required this.camera});

  @override
  CameraPreviewScreenState createState() => CameraPreviewScreenState();
}

class CameraPreviewScreenState extends State<CameraPreviewScreen> {
  // 카메라를 제어하는 컨트롤러입니다.
  CameraController? controller;
  // 카메라 컨트롤러 초기화를 위한 Future 객체입니다.
  Future<void>? initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // 카메라 컨트롤러를 초기화합니다.
    controller = CameraController(
      widget.camera, // 위젯에서 받아온 카메라 설명을 사용합니다.
      ResolutionPreset.medium, // 해상도를 중간으로 설정합니다.
    );
    // 컨트롤러를 초기화하고 그 결과를 Future 객체에 저장합니다.
    initializeControllerFuture = controller!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera Preview')),
      body: FutureBuilder<void>(
        // 컨트롤러 초기화를 기다립니다.
        future: initializeControllerFuture,
        builder: (context, snapshot) {
          // 초기화가 완료되면 카메라 프리뷰를 표시합니다.
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(controller!);
          } else {
            // 초기화 중일 때는 로딩 인디케이터를 표시합니다.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // 위젯이 제거될 때 컨트롤러를 해제합니다.
    controller!.dispose();
    super.dispose();
  }
}
