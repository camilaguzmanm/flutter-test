import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../models/ui_models/ui_colors.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: const LoadingIndicator(
        indicatorType: Indicator.ballPulseRise,
        colors: [primaryColor1, primaryColor2],
        strokeWidth: 3.0,
      ),
    );
  }
}
