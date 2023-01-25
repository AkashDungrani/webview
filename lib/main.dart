import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview/Views/Screens/bookmark.dart';
import 'package:webview/models/globals.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Webviewapp(),
      "bookmark": (context) => BookMark(),
    },
  ));
}

class Webviewapp extends StatefulWidget {
  const Webviewapp({super.key});

  @override
  State<Webviewapp> createState() => _WebviewappState();
}

class _WebviewappState extends State<Webviewapp> {
  InAppWebViewController? inAppWebViewController;
  // PullToRefreshController pullToRefreshController=PullToRefreshController(onRefresh:  );
  // List<String> allbookmark = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Google"),
        actions: [
          IconButton(
              onPressed: () async {
                await inAppWebViewController?.loadUrl(
                    urlRequest: URLRequest(
                        url: Uri.parse(
                            "https://www.google.co.in/?client=safari&channel=mac_bm")));
              },
              icon: Icon(Icons.home)),
          IconButton(
              onPressed: () async {
                await inAppWebViewController?.goBack();
              },
              icon: Icon(Icons.arrow_back_ios)),
          IconButton(
              onPressed: () async {
                await inAppWebViewController?.reload();
              },
              icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () async {
                await inAppWebViewController?.goForward();
              },
              icon: Icon(Icons.arrow_forward_ios))
        ],
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () async {
            Uri? uri = await inAppWebViewController?.getUrl();
            String url = uri.toString();
           allbookmarks.add(url);
          },
          child: Icon(Icons.bookmark_add_outlined),
        ),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          backgroundColor: Colors.black,
          heroTag: "bookmark",
          onPressed: () {
            Navigator.pushNamed(context, "bookmark");
            print(allbookmarks);
            
          },
          child: Icon(Icons.bookmarks),
        ),
      ]),
      body: InAppWebView(
        onWebViewCreated: (controller) {
          inAppWebViewController = controller;
        },
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://www.google.co.in/?client=safari&channel=mac_bm")),
        // pullToRefreshController: ,
      ),
    );
  }
}
