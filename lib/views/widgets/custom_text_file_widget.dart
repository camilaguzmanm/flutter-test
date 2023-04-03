import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/ui_models/ui_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Color? errorColor;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.validator,
    this.errorColor,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            _focused = hasFocus;
          });
        },
        child: Column(
          children: [
            TextFormField(
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              validator: widget.validator,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(bottom: 5),
                errorStyle: TextStyle(color: widget.errorColor),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 2,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _focused ? primaryColor1 : Colors.grey,
                    width: _focused ? 2.0 : 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
