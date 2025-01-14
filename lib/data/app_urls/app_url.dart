class AppURL {
  static const String kBaseURL = "https://pharma-tec.nami-tec.com/api/";
  ///Auth
 static const String kLoginURI = "delegate/auth/login";
 static const String kRegisterURI = "delegate/auth/register";
 static const String kUpdateProfileURI = "delegate/profile/updateProfile";
 static const String kLogoutURI = "delegate/profile/logout";
 static const String kDeleteAccountURI = "delegate/profile/deleteAccount";
 static const String kUpdateFCMTokenURI = "delegate/profile/updateToken";
  ///cared ..
   static const String kCaredURI = "delegate/orders/calculateOrderCost";
  ///categories ..
  static const String kCategoriesURI = "delegate/home/categories";
  ///products ..
  static const String kProductsURI = "delegate/home/products";
  static const String kLatestProductsURI = "delegate/home/latestProducts";
  static const String kListOffersProductsURI = "delegate/home/offers?page=";
  static const String kIsFavoriteURI = "delegate/home/add-remove-favorites";
  static const String kOrders = "delegate/orders";
  static const String kPayment = "payment2/";
  static const String kCalculateOrderCost = "delegate/orders/calculateOrderCost";


  ///setting
  static const String kMyFavoriteURI = "delegate/profile/myFavorites";
  static const String kPointsURI = "delegate/profile/pointsHistory";
  static const String kContactUsURL = "contact-us";
  static const String kSettingURI = "setting";
  ///home
  static const String kHomeSliderURI = "delegate/home/slider";
  static const String kGetNotificationsURI = "delegate/profile/notifications";
  ///orders
  static const String kMyOrder = "delegate/orders";

  ///notifications
///cities
///
   static const String kGetCitiesURI = "cities";
}
