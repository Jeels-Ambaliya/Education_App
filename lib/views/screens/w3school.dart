import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class W3School extends StatefulWidget {
  const W3School({Key? key}) : super(key: key);

  @override
  State<W3School> createState() => _W3SchoolState();
}

class _W3SchoolState extends State<W3School> {
  late InAppWebViewController myWeb;
  String myUrl = "https://www.w3schools.com/";

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
