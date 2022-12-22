class LoginResponseModel {
  String? route;

  LoginResponseModel({this.route});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    route = json['route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['route'] = route;
    return data;
  }
}
