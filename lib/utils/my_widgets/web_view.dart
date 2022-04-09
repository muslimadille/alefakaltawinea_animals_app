import 'dart:convert';

import 'package:alefakaltawinea_animals_app/modules/profile/profileScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

import '../../modules/baseScreen/baseScreen.dart';
import '../my_utils/myUtils.dart';


class WebPage extends StatefulWidget {
  String link;
  WebPage(this.link,{Key? key}) : super(key: key);
  @override
  _WebPageState createState() => _WebPageState();
}


class _WebPageState extends State<WebPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      tag: '',
      body: SafeArea(child:

    WebView(
      initialUrl: widget.link,
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: Set.from([
        JavascriptChannel(
            name: 'messageHandler',
            onMessageReceived: (JavascriptMessage message) {
              print(message.message);
              var jsonData = jsonDecode(message.message);
              if(jsonData['status'] == 'CANCELLED'){
                // Your code
              }else if(jsonData['status'] == 'SUCCESS'){
                // Your code
              }
            })
      ]),
      onPageFinished: (value){
        print("$value" );
        if (value.toString().contains("success-callback")){
          MyUtils.navigateReplaceCurrent(context, ProfileScreen());
        }
        if(value.toString().contains("error-callback")){
          Navigator.pop(context);
          Fluttertoast.showToast(msg:tr("فشل عملية الدفع حاول مرة اخري"));
        }

      },
      onWebViewCreated: (WebViewController webViewController) {
        webViewController.currentUrl().then((value) {
          print("$value");
          if (value.toString().contains("success-callback")){
            MyUtils.navigateReplaceCurrent(context, ProfileScreen());
          }
          if(value.toString().contains("error-callback")){
            Navigator.pop(context);
            Fluttertoast.showToast(msg:tr("فشل عملية الدفع حاول مرة اخري"));
          }
        });
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.contains("success")){
          MyUtils.navigateReplaceCurrent(context, ProfileScreen());
          return NavigationDecision.prevent;
        }

        return NavigationDecision.navigate;
      },
    )

      ,), showBottomBar: false, showSettings: false,);
  }
}
