class HotelLocationModel {
  int? id;
  String? name;
  int? activeHotels;
  String? latitude;
  String? longitude;
  String? country;

  HotelLocationModel(
      {this.id,
      this.name,
      this.activeHotels,
      this.latitude,
      this.longitude,
      this.country});

  HotelLocationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    activeHotels = json['active_hotels'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['active_hotels'] = activeHotels;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['country'] = country;
    return data;
  }
}
