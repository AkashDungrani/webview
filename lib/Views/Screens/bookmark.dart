import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview/main.dart';
import 'package:webview/models/globals.dart';

class BookMark extends StatefulWidget {
  const BookMark({super.key});

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  InAppWebViewController? inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context).
    return Scaffold(
      appBar: AppBar(title: Text("BookMark")),
      body: Column(
        children: [
          ...allbookmarks.map(
            (e) => GestureDetector(
              onTap: () async {
                await inAppWebViewController?.loadUrl(
                    urlRequest: URLRequest(url: Uri.parse(e)));
                print(e);
                // Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
                child: Text(e),
              ),
            ),
          )
        ],
      ),
    );
  }
}
