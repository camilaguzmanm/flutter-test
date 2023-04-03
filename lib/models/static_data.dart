import 'package:flutter/material.dart';

import '../views/screens/add_post_view.dart';
import '../views/screens/home_view.dart';
import '../views/screens/posts_view.dart';

String  titleContent =  '';
String  descriptionContent =  '';
int  userIdContent =  0;

void switchFromBottomNavigation(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PostsView()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddPostView()),
      );
      break;
  }
}