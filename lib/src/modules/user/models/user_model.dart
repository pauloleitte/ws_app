class UserModel {
  bool? auth;
  String? token;
  String? name;
  String? email;

  UserModel({this.auth, this.token, this.name, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    auth = json['auth'];
    token = json['token'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth'] = this.auth;
    data['token'] = this.token;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}