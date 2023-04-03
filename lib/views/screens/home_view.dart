import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_test/views/scaffolds/Background.dart';
import 'package:flutter_technical_test/views/screens/posts_view.dart';

import '../../models/static_data.dart';
import '../../models/ui_models/ui_colors.dart';
import '../../models/ui_models/ui_size_converter.dart';
import '../../models/ui_models/ui_text_styles.dart';
import '../widgets/commons/button_widget.dart';
import '../widgets/side_text_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/Home';

  @override
  createState() => PostsState();
}

class PostsState extends State<HomeView> {
  String tag = 'HomeView';
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switchFromBottomNavigation(index, context);
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        isHomeView: true,
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
        title: '',
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/models.svg",
              width: relativeWidth(iosValue: 400, androidValue: 400),
              height: relativeHeight(iosValue: 400, androidValue: 400),
              fit: BoxFit.contain,
            ),
            const SideTextWidget(),
            Container(
              padding: EdgeInsets.only(
                right: relativeHeight(iosValue: 5, androidValue: 5),
                left: relativeHeight(iosValue: 60, androidValue: 60),
                bottom: relativeHeight(iosValue: 50, androidValue: 50),
                top: relativeHeight(iosValue: 420, androidValue: 420),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: relativeHeight(iosValue: 10, androidValue: 10),
                ),
                child: Column(
                  children: [
                    Text(
                      "Bienvenido a",
                      style: styleH3B(primaryColor1),
                    ),
                    Text(
                      "sitec",
                      style: styleH1(primaryColor2),
                    ),
                    ButtonWidget(
                      nombre: "Ingresa ahora",
                      actionsToDo: () {
                        _onItemSelected.call(1);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostsView(),
                          ),
                        );
                      },
                      width: relativeWidth(iosValue: 200, androidValue: 200),
                      height: relativeHeight(iosValue: 45, androidValue: 45),
                      color: cWhite,
                      size: 20,
                      icon: Icons.arrow_forward_ios_rounded,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
