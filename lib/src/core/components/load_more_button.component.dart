import 'package:flutter/material.dart';

class LoadMoreButtonComponent extends StatelessWidget {
  final VoidCallback onPressed;
  const LoadMoreButtonComponent({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text("Load More"),
      ),
    );
  }
}
