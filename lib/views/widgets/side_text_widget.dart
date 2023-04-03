import 'package:flutter/material.dart';

import '../../models/ui_models/ui_colors.dart';
import '../../models/ui_models/ui_size_converter.dart';
import '../../models/ui_models/ui_text_styles.dart';

class SideTextWidget extends StatelessWidget {
  const SideTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Align(
        alignment: FractionalOffset.bottomRight,
        child: Container(
          padding: EdgeInsets.only(
            right: relativeHeight(iosValue: 5, androidValue: 5),
            left: relativeHeight(iosValue: 5, androidValue: 5),
            bottom: relativeHeight(iosValue: 50, androidValue: 50),
            top: relativeHeight(iosValue: 50, androidValue: 50),
          ),
          decoration: const BoxDecoration(
              color: primaryColor2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(200),
              )),
          child: RotatedBox(
            quarterTurns: 3,
            child: Padding(
              padding: EdgeInsets.only(
                top: relativeWidth(iosValue: 10, androidValue: 10),
              ),
              child: Text(
                'registrate ya!',
                style: styleBold(20, cWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
