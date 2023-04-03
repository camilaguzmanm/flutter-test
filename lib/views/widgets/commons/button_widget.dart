import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/ui_models/ui_size_converter.dart';
import 'package:flutter_technical_test/models/ui_models/ui_text_styles.dart';

import '../../../models/ui_models/ui_colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      this.actionsToDo,
      required this.nombre,
      required this.width,
      required this.height,
      required this.color,
      required this.size,
      required this.icon,
      this.widget})
      : super(key: key);

  final VoidCallback? actionsToDo;
  final String nombre;
  final double width;
  final double height;
  final Color color;
  final double size;
  final IconData icon;
  final Function()? widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: actionsToDo,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: primaryColor1,
        ),
        margin: EdgeInsets.only(
          bottom: relativeHeight(iosValue: 10, androidValue: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              nombre,
              style: styleBold(size, color),
              textAlign: TextAlign.left,
            ),
            Icon(icon, color: cWhite, size: 18),
          ],
        ),
      ),
    );
  }
}
