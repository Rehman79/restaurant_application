import 'package:flutter/material.dart';

class IconCont extends StatelessWidget {
  final String path;

  const IconCont({required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      height: 37,
      child: Image.asset(
        path,
        fit: BoxFit.contain,
      ),
    );
  }
}
