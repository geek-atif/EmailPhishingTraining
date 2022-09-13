import 'dart:async';
import 'dart:io';
import '../../../ui/styles/my_app_theme.dart';
import '../../../ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({Key? key}) : super(key: key);

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  String webUrl = "http://demo.whitehax.com/whlite/puzzleGame.html/id=213";
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  final _key = UniqueKey();
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MyAppTheme.primaryColorSecond),
    );

    // webUrl = Get.arguments;
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: const Center(
        //     child: Padding(
        //       padding: EdgeInsets.only(right: 25),
        //       child: BlackText18(
        //         data: "",
        //       ),
        //     ),
        //   ),
        //   leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back_sharp,
        //       color: Colors.black,
        //       size: 35,
        //     ),
        //     onPressed: () => Get.back(),
        //   ),
        // ),
        body: Stack(
          children: [
            WebView(
              initialUrl: webUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onProgress: (int progress) {
                print('WebView is loading (progress : $progress%)');
                setState(() {
                  if (progress == 100) {
                    isLoading = false;
                  }
                });
              },
              javascriptChannels: <JavascriptChannel>{
                _toasterJavascriptChannel(context),
              },
            ),
            isLoading
                ? const Center(
                    child: Loading(
                      loadingMessage: "",
                    ),
                  )
                : Stack(),
          ],
        ),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
