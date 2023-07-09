class OtpModel {
  OtpModel({
    this.email,
    this.otp
  });
  String? email;
  String? otp;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'otp': otp,
    };
  }
  OtpModel.fromMap(Map<String, dynamic> map) {
    this.otp = map['otp'];
    this.email = map['email'];
  }
}