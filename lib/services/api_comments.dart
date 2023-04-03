
import 'dart:convert';

import 'package:flutter_technical_test/models/static_data_api.dart';

import '../models/api_constants.dart';
import '../models/comments/comments.dart';
import 'api.dart';

Future<int> getComments() async {
  const String ecommerceUrl = getEcommerceUrl;
  const String commentsUrl1 = getCommentsUrl1;
  const String commentsUrl2 = getCommentsUrl2;
  const String tag = 'Api:GetComments';

  Uri url = Uri.parse('$ecommerceUrl$commentsUrl1$idPost$commentsUrl2');
  final data = await Api.getData(tag, url);

  if (data['statusCode'] == 200) {
    String responseBody = utf8.decode(data['body']);
    commentsStatic = commentsListFromJson(responseBody);
    return 200;
  }

  if (data['statusCode'] == 400) {
    return 400;
  }

  return 500;
}