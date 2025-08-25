import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key, required this.url});
  final String url;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late final WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
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
          onWebResourceError: (error) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
        
            children: [
              Text('News', style: TextStyle(fontWeight: FontWeight.bold)),

              Text(
                'Cloud',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(color: Colors.orange,),
            ),
        ],
      ),
    );
  }
}
