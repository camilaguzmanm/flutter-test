import 'package:flutter/material.dart';

import '../../../models/ui_models/ui_colors.dart';
import '../../../models/ui_models/ui_text_styles.dart';
import '../../../models/ui_models/ui_size_converter.dart';
import 'button_widget.dart';

class ReusableCardWidget extends StatefulWidget {
  const ReusableCardWidget({
    Key? key,
    required this.title,
    required this.body,
    required this.isPost,
    this.actionsToDo,
  }) : super(key: key);

  final String title;
  final String body;
  final bool isPost;
  final VoidCallback? actionsToDo;

  @override
  _ReusableCardWidgetState createState() => _ReusableCardWidgetState();
}

class _ReusableCardWidgetState extends State<ReusableCardWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cPostCard,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: relativeHeight(iosValue: 160, androidValue: 160),
            child: Padding(
              padding: EdgeInsets.only(
                left: relativeWidth(iosValue: 20, androidValue: 20),
                right: relativeWidth(iosValue: 15, androidValue: 15),
                top: relativeHeight(iosValue: 15, androidValue: 15),
              ),
              child: buildSubtitle(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              right: relativeWidth(iosValue: 15, androidValue: 15),
              top: relativeHeight(iosValue: 4, androidValue: 4),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: widget.isPost
                  ? ButtonWidget(
                      actionsToDo: widget.actionsToDo,
                      nombre: 'Comentarios',
                      width: relativeWidth(iosValue: 102, androidValue: 102),
                      height: relativeHeight(iosValue: 28, androidValue: 28),
                      color: cWhite,
                      size: 10,
                      icon: Icons.remove_red_eye_outlined,
                    )
                  : ButtonWidget(
                      actionsToDo: widget.actionsToDo,
                      nombre: 'Detalle',
                      width: relativeWidth(iosValue: 80, androidValue: 80),
                      height: relativeHeight(iosValue: 28, androidValue: 28),
                      color: cWhite,
                      size: 10,
                      icon: Icons.remove_red_eye_outlined,
                    ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSubtitle() {
    List<String> subtitles = [
      widget.isPost ? "Descripción:" : "Mensaje:",
    ];

    List<String> values = [
      widget.body,
    ];

    final bool isLongText = values[0].length > 65;

    return Container(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: styleH3A(primaryColor1),
            ),
            spaceBetween(),
            Text(
              subtitles[0],
              style: styleSemiBold(13.01, primaryColor2),
            ),
            isLongText
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        values[0].substring(0, 65) + "...",
                        style: styleRegular(13.01, cBlack),
                      ),
                      InkWell(
                        child: Text(
                          "Leer más",
                          style: styleRegular(13.01, primaryColor1),
                        ),
                        onTap: () {
                          setState(() {
                            _isExpanded = true;
                          });
                        },
                      ),
                      _isExpanded
                          ? Text(
                              values[0].substring(65),
                              style: styleRegular(13.01, cBlack),
                            )
                          : const SizedBox.shrink(),
                      _isExpanded
                          ? InkWell(
                              child: Text(
                                "Leer menos",
                                style: styleRegular(13.01, primaryColor1),
                              ),
                              onTap: () {
                                setState(() {
                                  _isExpanded = false;
                                });
                              },
                            )
                          : const SizedBox.shrink(),
                    ],
                  )
                : Text(
                    values[0],
                    style: styleRegular(13.01, cBlack),
                  ),
          ],
        ),
      ),
    );
  }

  SizedBox spaceBetween() {
    return SizedBox(
      height: relativeHeight(iosValue: 8, androidValue: 8),
    );
  }
}
