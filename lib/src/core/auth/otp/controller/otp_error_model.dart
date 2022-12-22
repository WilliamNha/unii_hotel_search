class OtpErrorModel {
  List<String>? otp;

  OtpErrorModel({this.otp});

  OtpErrorModel.fromJson(Map<String, dynamic> json) {
    otp = json['otp'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    return data;
  }
}
