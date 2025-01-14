class AppURL {
  static const String kBaseURL = "https://pharma-tec.nami-tec.com/api/";
  ///Auth
 static const String kLoginURI = "user/auth/login";
 static const String kRegisterURI = "user/auth/register";
 static const String kUpdateProfileURI = "user/profile/updateProfile";
 static const String kLogoutURI = "user/profile/logout";
 static const String kDeleteAccountURI = "user/profile/deleteAccount";
 static const String kUpdateFCMTokenURI = "user/profile/updateToken";
  ///cared ..
   static const String kCaredURI = "user/orders/calculateOrderCost";
  ///categories ..
  static const String kCategoriesURI = "user/home/categories";
  ///products ..
  static const String kProductsURI = "user/home/products";
  static const String kLatestProductsURI = "user/home/latestProducts";
  static const String kListOffersProductsURI = "user/home/offers?page=";
  static const String kIsFavoriteURI = "user/home/add-remove-favorites";
  static const String kOrders = "user/orders";
  static const String kPayment = "payment2/";
  static const String kCalculateOrderCost = "user/orders/calculateOrderCost";


  ///setting
  static const String kMyFavoriteURI = "user/profile/myFavorites";
  static const String kPointsURI = "user/profile/pointsHistory";
  static const String kContactUsURL = "contact-us";
  static const String kSettingURI = "setting";
  ///home
  static const String kHomeSliderURI = "user/home/slider";
  static const String kGetNotificationsURI = "user/profile/notifications";
  ///orders
  static const String kMyOrder = "user/orders";

  ///notifications
///cities
///
   static const String kGetCitiesURI = "cities";
}
