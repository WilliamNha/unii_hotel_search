class SignupErrorModel {
  List<String>? phoneNumber;

  SignupErrorModel({this.phoneNumber});

  SignupErrorModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    return data;
  }
}
