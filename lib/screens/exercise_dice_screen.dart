import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ExerciseDiceScreen extends StatefulWidget {
  const ExerciseDiceScreen({super.key});

  @override
  State<ExerciseDiceScreen> createState() => _ExerciseDiceScreenState();
}

class _ExerciseDiceScreenState extends State<ExerciseDiceScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    final WebViewController controller = WebViewController();

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            // 웹뷰 로딩 오류를 콘솔에 출력
            print('WebResourceError: ');
            print('  ErrorCode: ${error.errorCode}');
            print('  Description: ${error.description}');
            // print('  Domain: ${error.domain}'); // 제거
            // print('  FailingUrl: ${error.failingUrl}'); // 제거
            print('  IsForMainFrame: ${error.isForMainFrame}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      );

    _loadHtmlFromAssets(controller);
    _controller = controller;
  }

  Future<void> _loadHtmlFromAssets(WebViewController controller) async {
    final String fileText = await rootBundle.loadString('assets/web/dodecahedron.html');
    controller.loadRequest(Uri.dataFromString(
      fileText,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('12면체 운동 주사위'),
        backgroundColor: Colors.black,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
