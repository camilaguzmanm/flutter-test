import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/ui_models/ui_text_styles.dart';

import '../../models/ui_models/ui_colors.dart';
import '../../models/ui_models/ui_size_converter.dart';
import '../widgets/custom_navigation_widget.dart';

class Background extends StatefulWidget {
  final Widget child;
  final int? selectedIndex;
  final Function(int)? onItemSelected;
  final String title;
  final bool isHomeView;
  const Background({
    Key? key,
    required this.child,
    this.selectedIndex,
    this.onItemSelected,
    required this.title,
    this.isHomeView = false,
  }) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {

  @override
  Widget build(BuildContext context) {
    double headerSize = relativeHeight(
      iosValue: 100,
      androidValue: 100,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [cBackgroundColor2, cBackgroundColor1],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: headerSize,
                width: double.infinity,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    widget.isHomeView
                        ? Container()
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  color: primaryColor2),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: styleH3B(primaryColor2),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: widget.child),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: widget.selectedIndex,
        onItemSelected: widget.onItemSelected,
      ),
    );
  }
}
