import 'dart:async';
import 'dart:convert';

import '../models/api_constants.dart';
import '../models/posts/posts.dart';
import '../models/static_data_api.dart';
import 'api.dart';

Future<int> getPosts() async {
  const String ecommerceUrl = getEcommerceUrl;
  const String postsUrl = getPostsUrl;
  const String tag = 'Api:GetPosts';

  Uri url = Uri.parse('$ecommerceUrl$postsUrl');
  final data = await Api.getData(tag, url);

  if (data['statusCode'] == 200) {
    String responseBody = utf8.decode(data['body']);
    postStatic = postListFromJson(responseBody);
    return 200;
  }

  if (data['statusCode'] == 400) {
    return 400;
  }

  return 500;
}

Future<int> createPost(Map<String, dynamic> postData) async {
  const String ecommerceUrl = getEcommerceUrl;
  const String postsUrl = getCommentsUrl1;
  const String tag = 'Api:CreatePost';

  Uri url = Uri.parse('$ecommerceUrl$postsUrl');
  final data = await Api.postData(tag, url, postData);

  if (data['statusCode'] == 201) {
    return 201;
  }

  if (data['statusCode'] == 400) {
    return 400;
  }

  return 500;
}
