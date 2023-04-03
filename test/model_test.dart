import 'package:flutter_test/flutter_test.dart';

String tag = "UnitTest";

List<List<Object>> model = [
  // [
  //   Post,
  //   Post.defaultInstance(),
  //   postListFromJson(Post.otherInstance().toString()),
  // ],
  // [
  //   Comments,
  //   Comments.defaultInstance(),
  //   commentsListFromJson(Comments.otherInstance().toString()),
  // ]
];

void main() {
  for (int i = 0; i < model.length; i++) {
    group("Model: ${model[i][0].toString()}", () {
      testWidgets('Test - Def.Ins.', (WidgetTester tester) async {
        expect(model[i][1].runtimeType, model[i][0]);
      });

      testWidgets('Test - toString', (WidgetTester tester) async {
        expect(model[i][2].runtimeType, model[i][0]);
      });

      testWidgets('Control Test - Def.Ins. vs toString',
          (WidgetTester tester) async {
        expect(model[i][1].runtimeType, model[i][2].runtimeType);
      });
    });
  }
}
