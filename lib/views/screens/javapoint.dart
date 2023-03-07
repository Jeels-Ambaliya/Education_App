import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class JavaPoint extends StatefulWidget {
  const JavaPoint({Key? key}) : super(key: key);

  @override
  State<JavaPoint> createState() => _JavaPointState();
}

class _JavaPointState extends State<JavaPoint> {
  late InAppWebViewController myWeb;
  String myUrl = "https://www.javatpoint.com/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if (await myWeb.canGoBack()) {
              myWeb.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: InAppWebView(
            onWebViewCreated: (controller) async {
              myWeb = controller;
            },
            initialUrlRequest: URLRequest(
              url: Uri.parse(myUrl),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
