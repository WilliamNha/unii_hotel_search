class OtpResponseModel {
  String? apiKey;

  OtpResponseModel({this.apiKey});

  OtpResponseModel.fromJson(Map<String, dynamic> json) {
    apiKey = json['api_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api_key'] = apiKey;
    return data;
  }
}
