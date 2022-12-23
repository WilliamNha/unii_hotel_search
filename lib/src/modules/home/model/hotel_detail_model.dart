class HotelDetailModel {
  int? hotelsId;
  String? hotelName;
  int? ratingAvg;
  String? starHotel;
  bool? isDiscount;
  String? defaultPriceRange;
  String? discountNote;
  String? priceRange;
  String? latitude;
  String? longitude;
  int? isFavorite;
  String? overview;
  int? numberOfReviews;
  String? address1;
  String? popularityScore;
  List<PopularFacilities>? popularFacilities;
  String? imageCoverUrl;
  List<Pictures>? pictures;
  List<String>? reviews;
  int? isPromote;
  String? promoteLabel;
  String? provinceName;
  String? cityName;
  String? country;

  HotelDetailModel(
      {this.hotelsId,
      this.hotelName,
      this.ratingAvg,
      this.starHotel,
      this.isDiscount,
      this.defaultPriceRange,
      this.discountNote,
      this.priceRange,
      this.latitude,
      this.longitude,
      this.isFavorite,
      this.overview,
      this.numberOfReviews,
      this.address1,
      this.popularityScore,
      this.popularFacilities,
      this.imageCoverUrl,
      this.pictures,
      this.reviews,
      this.isPromote,
      this.promoteLabel,
      this.provinceName,
      this.cityName,
      this.country});

  HotelDetailModel.fromJson(Map<String, dynamic> json) {
    hotelsId = json['hotels_id'];
    hotelName = json['hotel_name'];
    ratingAvg = json['rating_avg'];
    starHotel = json['star_hotel'];
    isDiscount = json['is_discount'];
    defaultPriceRange = json['default_price_range'];
    discountNote = json['discount_note'];
    priceRange = json['price_range'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isFavorite = json['is_favorite'];
    overview = json['overview'];
    numberOfReviews = json['number_of_reviews'];
    address1 = json['address_1'];
    popularityScore = json['popularity_score'];
    if (json['popular_facilities'] != null) {
      popularFacilities = <PopularFacilities>[];
      json['popular_facilities'].forEach((v) {
        popularFacilities!.add(PopularFacilities.fromJson(v));
      });
    }
    imageCoverUrl = json['image_cover_url'];
    if (json['pictures'] != null) {
      pictures = <Pictures>[];
      json['pictures'].forEach((v) {
        pictures!.add(Pictures.fromJson(v));
      });
    }
    // if (json['reviews'] != null) {
    //   reviews = <String>[];
    //   json['reviews'].forEach((v) {
    //     reviews!.add(Reviews.fromJson(v));
    //   });
    // }
    isPromote = json['is_promote'];
    promoteLabel = json['promote_label'];
    provinceName = json['province_name'];
    cityName = json['city_name'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotels_id'] = hotelsId;
    data['hotel_name'] = hotelName;
    data['rating_avg'] = ratingAvg;
    data['star_hotel'] = starHotel;
    data['is_discount'] = isDiscount;
    data['default_price_range'] = defaultPriceRange;
    data['discount_note'] = discountNote;
    data['price_range'] = priceRange;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['is_favorite'] = isFavorite;
    data['overview'] = overview;
    data['number_of_reviews'] = numberOfReviews;
    data['address_1'] = address1;
    data['popularity_score'] = popularityScore;
    if (popularFacilities != null) {
      data['popular_facilities'] =
          popularFacilities!.map((v) => v.toJson()).toList();
    }
    data['image_cover_url'] = imageCoverUrl;
    if (pictures != null) {
      data['pictures'] = pictures!.map((v) => v.toJson()).toList();
    }
    // if (reviews != null) {
    //   data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    // }
    data['is_promote'] = isPromote;
    data['promote_label'] = promoteLabel;
    data['province_name'] = provinceName;
    data['city_name'] = cityName;
    data['country'] = country;
    return data;
  }
}

class PopularFacilities {
  String? caption;
  String? icon;

  PopularFacilities({this.caption, this.icon});

  PopularFacilities.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['caption'] = caption;
    data['icon'] = icon;
    return data;
  }
}

class Pictures {
  String? pictureUrl;
  String? caption;

  Pictures({this.pictureUrl, this.caption});

  Pictures.fromJson(Map<String, dynamic> json) {
    pictureUrl = json['picture_url'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['picture_url'] = pictureUrl;
    data['caption'] = caption;
    return data;
  }
}
