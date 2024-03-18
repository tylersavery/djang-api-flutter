import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String body;
  final String title;
  const ErrorScreen({
    super.key,
    required this.body,
    this.title = "Error",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          body,
        ),
      ),
    );
  }
}
