import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchResutlWebView extends StatefulWidget {
  const SearchResutlWebView({super.key, required this.url});

  final String url;

  @override
  State<SearchResutlWebView> createState() => _SearchResutlWebViewState();
}

class _SearchResutlWebViewState extends State<SearchResutlWebView> {

  bool isLoading = true;

  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
     _controller =  WebViewController();
    _controller..setNavigationDelegate(_navigationDelegate)..loadRequest(Uri.parse(widget.url)); 
  }

   NavigationDelegate get _navigationDelegate {
    return NavigationDelegate(
      onPageStarted: (url) {
        setState(() {
          isLoading = true;
        });
      },
      onPageFinished: (url) {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  void onBackPress() {
    Navigator.pop(context);
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: onBackPress,
          child: const Icon(Icons.arrow_back,),
        ),
        title: const Text('Meaning',),
      ),
      body: Center(
        child: isLoading ? const CircularProgressIndicator() : WebViewWidget(controller: _controller),
      ),
    );
  }
}