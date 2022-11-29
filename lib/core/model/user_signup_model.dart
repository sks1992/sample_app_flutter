class UserSignUpModel {
  UserSignUpModel({
    required this.email,
    required this.password,
    required this.username,
  });
  late final String email;
  late final String password;
  late final String username;

  UserSignUpModel.fromJson(Map<String, dynamic> json){
    email = json['email'];
    password = json['password'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['username'] = username;
    return data;
  }
}