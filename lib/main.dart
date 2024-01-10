import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WebViewController controller = WebViewController();
  @override
  void initState() {
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) => {},
          onPageStarted: (url) => {},
          onPageFinished: (url) => {},
        ),
      )
      ..loadRequest(Uri.parse('https://114447.ebmeb.gov.bd'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // ignore: deprecated_member_use
        body: WillPopScope(
           onWillPop: () async {
            if (await controller.canGoBack()) {
              controller.canGoBack();
              return false;
            } else {
              return true;
            }
          },
      
          child: SafeArea(
            child: WebViewWidget(controller: controller),
          ),
        ),
      ),
    );
  }
}
