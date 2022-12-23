class HotelSearchModel {
  int? hotelsId;
  String? hotelName;
  String? priceMinOrder;
  String? city;
  String? province;
  String? country;
  int? ratingAvg;
  String? hotelLatitude;
  String? hotelLongitude;
  String? ccla;
  String? cclo;
  int? reviews;
  String? popularityScore;
  int? isSoldOut;
  int? listOrder;
  int? isPromote;
  String? promoteLabel;
  String? priceMin;
  String? priceMax;
  String? currency;
  String? symbol;
  int? currencyDecimal;
  String? priceRange;
  int? isFavorite;
  String? imageCoverUrl;
  String? cityCenterDistance;
  bool? isDiscount;
  String? defaultPriceRange;
  String? discountNote;
  bool? isPromotion;

  HotelSearchModel(
      {this.hotelsId,
      this.hotelName,
      this.priceMinOrder,
      this.city,
      this.province,
      this.country,
      this.ratingAvg,
      this.hotelLatitude,
      this.hotelLongitude,
      this.ccla,
      this.cclo,
      this.reviews,
      this.popularityScore,
      this.isSoldOut,
      this.listOrder,
      this.isPromote,
      this.promoteLabel,
      this.priceMin,
      this.priceMax,
      this.currency,
      this.symbol,
      this.currencyDecimal,
      this.priceRange,
      this.isFavorite,
      this.imageCoverUrl,
      this.cityCenterDistance,
      this.isDiscount,
      this.defaultPriceRange,
      this.discountNote,
      this.isPromotion});

  HotelSearchModel.fromJson(Map<String, dynamic> json) {
    hotelsId = json['hotels_id'];
    hotelName = json['hotel_name'];
    priceMinOrder = json['price_min_order'];
    city = json['city'];
    province = json['province'];
    country = json['country'];
    ratingAvg = json['rating_avg'];
    hotelLatitude = json['hotel_latitude'];
    hotelLongitude = json['hotel_longitude'];
    ccla = json['ccla'];
    cclo = json['cclo'];
    reviews = json['reviews'];
    popularityScore = json['popularity_score'];
    isSoldOut = json['is_sold_out'];
    listOrder = json['list_order'];
    isPromote = json['is_promote'];
    promoteLabel = json['promote_label'];
    priceMin = json['price_min'];
    priceMax = json['price_max'];
    currency = json['currency'];
    symbol = json['symbol'];
    currencyDecimal = json['currency_decimal'];
    priceRange = json['price_range'];
    isFavorite = json['is_favorite'];
    imageCoverUrl = json['image_cover_url'];
    cityCenterDistance = json['city_center_distance'];
    isDiscount = json['is_discount'];
    defaultPriceRange = json['default_price_range'];
    discountNote = json['discount_note'];
    isPromotion = json['is_promotion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotels_id'] = hotelsId;
    data['hotel_name'] = hotelName;
    data['price_min_order'] = priceMinOrder;
    data['city'] = city;
    data['province'] = province;
    data['country'] = country;
    data['rating_avg'] = ratingAvg;
    data['hotel_latitude'] = hotelLatitude;
    data['hotel_longitude'] = hotelLongitude;
    data['ccla'] = ccla;
    data['cclo'] = cclo;
    data['reviews'] = reviews;
    data['popularity_score'] = popularityScore;
    data['is_sold_out'] = isSoldOut;
    data['list_order'] = listOrder;
    data['is_promote'] = isPromote;
    data['promote_label'] = promoteLabel;
    data['price_min'] = priceMin;
    data['price_max'] = priceMax;
    data['currency'] = currency;
    data['symbol'] = symbol;
    data['currency_decimal'] = currencyDecimal;
    data['price_range'] = priceRange;
    data['is_favorite'] = isFavorite;
    data['image_cover_url'] = imageCoverUrl;
    data['city_center_distance'] = cityCenterDistance;
    data['is_discount'] = isDiscount;
    data['default_price_range'] = defaultPriceRange;
    data['discount_note'] = discountNote;
    data['is_promotion'] = isPromotion;
    return data;
  }
}
