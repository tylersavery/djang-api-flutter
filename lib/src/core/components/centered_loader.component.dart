import 'package:flutter/material.dart';

class CenteredLoaderComponent extends StatelessWidget {
  const CenteredLoaderComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
