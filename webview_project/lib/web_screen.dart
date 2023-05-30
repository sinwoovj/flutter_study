import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  WebScreen({Key? key}) : super(key: key);

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  bool isFinished = false;
  late WebViewController controller;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print('progress : $progress');
            this.progress = progress.toDouble() / 100;
            setState(() {});
          },
          onPageStarted: (String url) {
            print('onPageStarted : $url');
          },
          onPageFinished: (String url) {
            print('onPageFinished : $url');
            isFinished = true;
            setState(() {});
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('제목'),
        actions: [
          IconButton(
              onPressed: () {
                controller.loadRequest(Uri.parse('https://www.youtube.com/watch?v=Th84afHZ8XA'));
              },
              icon: Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
        ],
      ),
      body: Column(
        children: [
          Visibility(
              visible: !isFinished,
              child: LinearProgressIndicator(
                value: progress,
              )),
          Expanded(child: WebViewWidget(controller: controller)),
        ],
      ),
    );
  }
}
