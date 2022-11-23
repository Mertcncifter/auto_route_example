import 'package:flutter/material.dart';

class NotificationDetailPage extends StatelessWidget {
  final String text;
  const NotificationDetailPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notification Detail"),
        ),
        body: Center(child: Text(text)));
  }
}
