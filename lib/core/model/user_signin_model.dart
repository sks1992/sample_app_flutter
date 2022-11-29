class UserSignInModel {
  UserSignInModel({
    required this.email,
    required this.password,
  });

  late final String email;
  late final String password;

  UserSignInModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
