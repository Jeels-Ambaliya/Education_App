import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Wikipedia_Page extends StatefulWidget {
  const Wikipedia_Page({Key? key}) : super(key: key);

  @override
  State<Wikipedia_Page> createState() => _Wikipedia_PageState();
}

class _Wikipedia_PageState extends State<Wikipedia_Page> {
  late InAppWebViewController myWeb;
  String myUrl = "https://www.wikipedia.org/";

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
  }
}
