class LoginModel {
  LoginModel({
    this.email,
    this.password,
  });

  String? email;
  String? password;


  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
  LoginModel.fromMap(Map<String, dynamic> map) {
    this.email = map['email'];
    this.password = map['password'];

  }
}