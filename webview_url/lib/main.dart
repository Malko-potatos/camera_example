import 'package:flutter/material.dart';
import 'package:webview_url/web.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UrlInputScreen(),
    );
  }
}

class UrlInputScreen extends StatefulWidget {
  const UrlInputScreen({super.key});

  @override
  UrlInputScreenState createState() => UrlInputScreenState();
}

class UrlInputScreenState extends State<UrlInputScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('URL 입력')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: '웹 주소 입력'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewScreen(_controller.text),
                  ),
                );
              },
              child: const Text('웹뷰로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
