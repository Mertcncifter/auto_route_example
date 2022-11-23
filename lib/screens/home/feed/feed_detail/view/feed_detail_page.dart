import 'package:flutter/material.dart';

class FeedDetailPage extends StatelessWidget {
  final String text;
  const FeedDetailPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feed Detail"),
        ),
        body: Center(child: Text(text)));
  }
}
