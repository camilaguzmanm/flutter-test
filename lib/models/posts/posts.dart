import 'dart:convert';

/// userId : 1
/// id : 1
/// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
/// body : "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"

List<Post> postListFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postListToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }

  Post.fromJson(dynamic json) {
    _userId = json['userId'] ?? 0;
    _id = json['id'] ?? 0;
    _title = json['title'] ?? "";
    _body = json['body'] ?? "";
  }

  late int _userId;
  late int _id;
  late String _title;
  late String _body;

  int get userId => _userId;

  int get id => _id;

  String get title => _title;

  String get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }

  static Post defaultInstance() {
    return Post.fromJson(json.decode("{"
        "\"userId\":0,"
        "\"id\":0,"
        "\"title\":\"\","
        "\"body\":\"\""
        "}"));
  }

  static Post otherInstance(){
    return Post.fromJson(json.decode("{"
        "\"userId\":1,"
        "\"id\":1,"
        "\"title\":\"Titulo prueba\","
        "\"body\":\"Body Prueba\""
        "}"));
  }

  @override
  String toString() {
    return "{"
        "\"userId\":$_userId,"
        "\"id\":$_id,"
        "\"title\":\"$_title\","
        "\"body\":\"$_body\""
        "}";
  }
}
