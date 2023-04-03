

import 'package:flutter/material.dart';

// horizontal space
class HSpace extends StatelessWidget {
  final double width;
  const HSpace([this.width = 8.0]);
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

// vertical space
class VSpace extends StatelessWidget {
  final double height;
  const VSpace([this.height = 8.0]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}