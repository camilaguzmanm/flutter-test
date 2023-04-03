import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/ui_models/ui_colors.dart';

class CustomNavigationBar extends StatefulWidget {
  final int? selectedIndex;
  final Function(int)? onItemSelected;

  const CustomNavigationBar({Key? key, this.selectedIndex, this.onItemSelected})
      : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex ?? 0,
      onTap: widget.onItemSelected,
      selectedItemColor: primaryColor2,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Posts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.post_add),
          label: 'Agregar',
        ),
      ],
    );
  }
}
