import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/ui_models/ui_size_converter.dart';
import 'package:flutter_technical_test/views/scaffolds/Background.dart';
import 'package:flutter_technical_test/views/screens/comments_view.dart';
import 'package:flutter_technical_test/views/widgets/commons/loading_animation_widget.dart';

import '../../models/static_data.dart';
import '../../models/static_data_api.dart';
import '../../services/api_posts.dart';
import '../widgets/commons/reusable_card_widget.dart';

class PostsView extends StatefulWidget {
  const PostsView({Key? key}) : super(key: key);

  static const routeName = '/Posts';

  @override
  createState() => PostsViewState();
}

class PostsViewState extends State<PostsView> {
  String tag = 'PostView';
  int _selectedIndex = 1;
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  bool isNotEmpty = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        isLoading = ValueNotifier(true);
      });

      await getPosts();
      postStatic.isNotEmpty ? isNotEmpty = true : isNotEmpty = false;

      setState(() {
        isLoading = ValueNotifier(false);
      });
    });
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
      selectedIndex: _selectedIndex,
      onItemSelected: _onItemSelected,
      title: 'Posts',
      child: ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (BuildContext context, bool val, Widget? child) {
          return val
              ? Center(
                  child: LoadingAnimation(
                    height: relativeHeight(iosValue: 50, androidValue: 50),
                    width: relativeWidth(iosValue: 50, androidValue: 50),
                  ),
                )
              : ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    left: relativeWidth(iosValue: 20, androidValue: 20),
                    right: relativeWidth(iosValue: 20, androidValue: 20),
                  ),
                  children: fillPostCard(context, this),
                );
        },
      ),
    );
  }
}

List<Widget> fillPostCard(BuildContext context, widget) {
  List<Widget> answer = [];
  for (var i = 0; i < postStatic.length; i++) {
    var post = postStatic[i];
    answer.add(
      Padding(
        padding: EdgeInsets.only(
          bottom: relativeHeight(iosValue: 20, androidValue: 20),
        ),
        child: ReusableCardWidget(
          title: post.title,
          body: post.body,
          actionsToDo: () {
            idPost = post.id;
            widget._onItemSelected?.call(1);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CommentsView(),
              ),
            );
          },
          isPost: true,
        ),
      ),
    );
  }
  return answer;
}
