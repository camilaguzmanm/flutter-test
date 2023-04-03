import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/ui_models/ui_size_converter.dart';
import 'package:flutter_technical_test/models/ui_models/ui_text_styles.dart';
import 'package:flutter_technical_test/services/api_comments.dart';
import 'package:flutter_technical_test/views/scaffolds/Background.dart';
import 'package:flutter_technical_test/views/widgets/commons/loading_animation_widget.dart';

import '../../models/static_data.dart';
import '../../models/static_data_api.dart';
import '../../models/ui_models/ui_colors.dart';
import '../widgets/commons/reusable_card_widget.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({Key? key}) : super(key: key);

  static const routeName = '/Comments';

  @override
  createState() => CommentsViewState();
}

class CommentsViewState extends State<CommentsView> {
  String tag = 'CommentsView';
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

      await getComments();
      commentsStatic.isNotEmpty ? isNotEmpty = true : isNotEmpty = false;

      setState(() {
        isLoading = ValueNotifier(false);
      });
    });
  }
  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switchFromBottomNavigation(index, context);
  }
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      title: 'Comentarios',
      selectedIndex: _selectedIndex,
      onItemSelected: _onItemSelected,
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
                  children: fillCard(context),
                );
        },
      ),
    );
  }
}

List<Widget> fillCard(context) {
  List<Widget> answer = [];
  for (var i = 0; i < commentsStatic.length; i++) {
    var comment = commentsStatic[i];
    answer.add(
      Padding(
        padding: EdgeInsets.only(
          bottom: relativeHeight(iosValue: 20, androidValue: 20),
        ),
        child: ReusableCardWidget(
          title: comment.name,
          body: comment.body,
          actionsToDo: () {
            openDialogModal(comment.id, comment.email, comment.postId, context);
            commentsStatic[i].id;
          },
          isPost: false,
        ),
      ),
    );
  }
  return answer;
}
void openDialogModal(int id, String email, int idPost, context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Detalle del comentario con id $id', style: styleBold(16, primaryColor1)),
      content: Text('Email: $email \nId del post: $idPost'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cerrar', style: styleRegular(14, primaryColor2),),
        ),
      ],
    ),
  );
}
