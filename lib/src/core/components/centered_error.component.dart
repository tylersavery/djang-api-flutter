import 'package:flutter/material.dart';

class CenteredErrorComponent extends StatelessWidget {
  final String error;
  const CenteredErrorComponent(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(error),
      ),
    );
  }
}
