import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen(this.url, {super.key});

  @override
  State<StatefulWidget> createState() {
    return WebViewScreenState();
  }
}

class WebViewScreenState extends State<WebViewScreen> {
  WebViewController? webViewController;

  @override
  void initState() {
    webViewController = WebViewController()
      ..loadRequest(Uri.parse(widget.url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('웹뷰')),
      body: GestureDetector(
        onLongPress: () async {
          String? currentUrl = await webViewController?.currentUrl();
          if (currentUrl != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UrlDisplayScreen(currentUrl),
              ),
            );
          }
        },
        child: WebViewWidget(controller: webViewController!),
      ),
    );
  }
}

class UrlDisplayScreen extends StatelessWidget {
  final String url;

  const UrlDisplayScreen(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('URL 표시')),
      body: Center(child: Text(url)),
    );
  }
}
