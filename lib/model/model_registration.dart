class RegistrationModel {
  RegistrationModel({
    this.name,
    this.email,
    this.mobile,
    this.state,
    this.pin,
    this.password,
    this.referal
  });
  String? name;
  String? email;
  String? mobile;
  String? password;
  String? pin;
  String? state;
  String? referal;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': password,
      'pin': pin,
      'state': state,
      'referal': referal,
    };
  }
  RegistrationModel.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.email = map['email'];
    this.mobile = map['mobile'];
    this.password = map['password'];
    this.pin = map['pin'];
    this.state = map['state'];
    this.referal = map['referal'];
  }
}