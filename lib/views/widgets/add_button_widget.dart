import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/ui_models/ui_colors.dart';
import 'package:flutter_technical_test/models/ui_models/ui_text_styles.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.labelText,
    required this.isEnabled,
    this.actionsToDo,
  }) : super(key: key);

  final double width;
  final double height;
  final String labelText;
  final bool isEnabled;
  final VoidCallback? actionsToDo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? actionsToDo : null,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: isEnabled ? primaryColor1 : cGreyBackA,
          border: Border.all(
            style: BorderStyle.none,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(3)),
        ),
        child: Text(
          labelText,
          style: styleBold(16, isEnabled ? cWhite : cGreyHintText),
        ),
      ),
    );
  }
}
