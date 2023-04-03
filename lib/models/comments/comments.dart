import 'dart:convert';

/// postId : 2
/// id : 6
/// name : "et fugit eligendi deleniti quidem qui sint nihil autem"
/// email : "Presley.Mueller@myrl.com"
/// body : "doloribus at sed quis culpa deserunt consectetur qui praesentium\naccusamus fugiat dicta\nvoluptatem rerum ut voluptate autem\nvoluptatem repellendus aspernatur dolorem in"
List<Comments> commentsListFromJson(String str) =>
    List<Comments>.from(json.decode(str).map((x) => Comments.fromJson(x)));

String commentsListToJson(List<Comments> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));
//
// String commentsToJson(Comments data) => json.encode(data.toJson());

class Comments {
  Comments({
    required int postId,
    required int id,
    required String name,
    required String email,
    required String body,
  }) {
    _postId = postId;
    _id = id;
    _name = name;
    _email = email;
    _body = body;
  }

  Comments.fromJson(dynamic json) {
    _postId = json['postId'] ?? 0;
    _id = json['id'] ?? 0;
    _name = json['name'] ?? "";
    _email = json['email'] ?? "";
    _body = json['body'] ?? "";
  }

  late int _postId;
  late int _id;
  late String _name;
  late String _email;
  late String _body;

  int get postId => _postId;

  int get id => _id;

  String get name => _name;

  String get email => _email;

  String get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postId'] = _postId;
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['body'] = _body;
    return map;
  }

  static Comments defaultInstance() {
    return Comments.fromJson(json.decode("{"
        "\"postId\":0,"
        "\"id\":0,"
        "\"name\":\"\","
        "\"email\":\"\","
        "\"body\":\"\""
        "}"));
  }

  static Comments otherInstance() {
    return Comments.fromJson(json.decode("{"
        "\"postId\":1,"
        "\"id\":1,"
        "\"name\":\"prueba\","
        "\"email\":\"prueba\","
        "\"body\":\"Prueba\""
        "}"));
  }

  @override
  String toString() {
    return "{"
        "\"postId\":$_postId,"
        "\"id\":$_id,"
        "\"name\":\"$_name\","
        "\"email\":\"$_email\","
        "\"body\":\"$_body\""
        "}";
  }
}
