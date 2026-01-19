// lib/core/network/api_constants.dart
class ApiConstants {
  static const String baseUrl = 'http://46.202.134.87:5000';

  static const String login = '/api/auth/login';
  static const String verifyOtp = '/api/auth/verify-otp';
  static const String socialLogin = '/api/auth/social-login';
  static const String me = '/api/auth/me';
  static const String signUp = '/api/auth/sign-up';

  static const String myAccount = '/api/user/my-account';
  static const String myRewards = '/api/membership/my-rewards';
  static const String occasions = '/api/occasions';
  static const String products = '/api/products';
  static String productById(String id) => '/api/products/$id';

  static const String productCategoryLink = '/api/product-categories/link';
  static const String productCategoryUnlink = '/api/product-categories/unlink';

  static const String productPairsAdd = '/api/product-pairs/add';
  static const String productPairsRemove = '/api/product-pairs/remove';

  static String boxAddItem(String boxId) => '/api/boxes/$boxId/add-item';
  static String boxItemQuantity(String itemId) =>
      '/api/boxes/item/$itemId/quantity';
  static String boxItem(String itemId) => '/api/boxes/item/$itemId';

  static const String boxTypes = '/api/box-types';
  static String boxTypeById(String id) => '/api/box-types/$id';
  static const String boxType = '/api/boxType';

  static const String createBox = '/api/boxes/create';
  static const String boxes = '/api/boxes';
  static String boxById(String id) => '/api/boxes/$id';

  static const String cartAdd = '/api/cart/add';
  static const String cart = '/api/cart';
  static const String cartCount = '/api/cart/count';
  static String cartUpdate(String id) => '/api/cart/update/$id';
  static String cartRemove(String id) => '/api/cart/remove/$id';

  static const String wishlist = '/api/wishlist';
  static const String wishlistItem = '/api/wishlist/item';
  static String wishlistItemById(int id) => '/api/wishlist/item/$id';

  static const String checkoutPreview = '/api/checkout/preview';
  static const String checkoutCreate = '/api/checkout/create';
  static String checkoutById(String id) => '/api/checkout/$id';
  static const String myOrders = '/api/checkout/my-orders';
  static String cancelOrder(int id) => '/api/admin/orders/$id/cancel';
  static const String myCards = '/api/payment-methods/my-cards';
  static const String addCard = '/api/payment-methods/add';
  static String paymentMethodById(String cardId) =>
      '/api/payment-methods/$cardId';

  static const String home = '/api/home';
}