import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

void main() async {
  // 앱을 시작하기 전에 필요한 초기화 작업을 수행합니다.
  WidgetsFlutterBinding.ensureInitialized();

  // 사용 가능한 카메라 목록을 가져옵니다.
  final cameras = await availableCameras();

  // 앱을 시작합니다.
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  // 생성자에서 사용 가능한 카메라 목록을 받아옵니다.
  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // CameraInfoScreen 위젯을 홈 화면으로 설정합니다.
      home: CameraInfoScreen(cameras: cameras),
    );
  }
}

class CameraInfoScreen extends StatelessWidget {
  final List<CameraDescription> cameras;

  // 생성자에서 사용 가능한 카메라 목록을 받아옵니다.
  const CameraInfoScreen({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Available Cameras')),
      body: ListView.builder(
        itemCount: cameras.length,
        itemBuilder: (context, index) {
          // 현재 인덱스의 카메라 정보를 가져옵니다.
          final camera = cameras[index];
          return Card(
            margin: const EdgeInsets.all(10.0),
            elevation: 5.0,
            child: ListTile(
              // 카메라의 렌즈 방향에 따라 아이콘을 표시합니다.
              leading: Icon(
                camera.lensDirection == CameraLensDirection.front
                    ? Icons.camera_front
                    : Icons.camera_rear,
                size: 40.0,
                color: Colors.blue,
              ),
              title: Text(
                'Camera ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              // 카메라의 상세 정보를 서브타이틀로 표시합니다.
              subtitle: Text(
                '렌즈 방향: ${camera.lensDirection}\n'
                '센서 위치: ${camera.sensorOrientation}°\n'
                'Camera(ID): ${camera.name}',
              ),
              contentPadding: const EdgeInsets.all(10.0),
              tileColor: Colors.grey[100],
            ),
          );
        },
      ),
    );
  }
}
