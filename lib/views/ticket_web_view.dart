import 'package:beauty_connect_guest/constants/global_variables.dart';
import 'package:beauty_connect_guest/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/guest_controller.dart';


class TicketWebView extends StatefulWidget {
  @override
  State<TicketWebView> createState() => _TicketWebViewState();
}

class _TicketWebViewState extends State<TicketWebView> {
  late final WebViewController _controller;
  GuestController guestController=Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(guestController.ticketUrl.value));
  }
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        bottomOpacity: 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.cardColor,
        shadowColor: Colors.black26,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset("assets/images/app_logo.png", scale: 16,)),
        actions: [
          IconButton(onPressed: (){

            Get.offAll(()=>WelcomeScreen());
          }, icon: Icon(Icons.home_filled,color:AppColors.whiteColor,))
        ],
      ),
      body:WebViewWidget(controller: _controller),
    );
  }
}
