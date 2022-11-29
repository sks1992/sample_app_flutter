class UserResult {
  UserResult({
    this.user,
    this.token,
    this.message,
  });

  late final User? user;
  late final String? token;
  late final String? message;

  UserResult.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user?.toJson();
    data['token'] = token;
    data['message'] = message;
    return data;
  }
}

class User {
  User({
    required this.username,
    required this.email,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  late final String username;
  late final String email;
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final int v;

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}
