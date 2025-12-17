class AppLink {

//--------------------------Old  Online Server Host ------------
  //static const String server = "https://ruqaih.000webhostapp.com";
//-------------------------- New Online Server Host ------------
 // static const String server = "https://roqsalecommerce.infinityfreeapp.com/";

  //------------------------ xampp localhost server

  //static const String server ="http://10.0.2.2/ecommercecourse_PHP_170_roq_2026";

  static const String server ="http://192.168.0.196/ecommercecourse_PHP_170_roq_2026";
//--------------------------------------------------------------------------

  //static const String imageststatic ="http://10.0.2.2/ecommercecourse_PHP_170_roq_2026/upload";

  static const String imageststatic ="http://192.168.0.196/ecommercecourse_PHP_170_roq_2026/upload";

//========================== Image ============================
//   static const String imagestCategories = "$imageststatic/categories";
//   static const String imagestItems = "$imageststatic/items";
// =============================================================

  //----------------------------------------------------------------------------------
  static const String test = "$server/test_getAllData.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/delivery/auth/signup.php";
  static const String login = "$server/delivery/auth/login.php";
  static const String verifycodessignup = "$server/delivery/auth/verfiycode.php";
  static const String resend = "$server/delivery/auth/resend.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/delivery/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/delivery/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/delivery/forgetpassword/verifycode.php";

// Home

  static const String homepage = "$server/home.php";
// items
  //static const String items = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";

// Favorite

  //static const String favoriteAdd = "$server/favorite/add.php";
  //static const String favoriteRemove = "$server/favorite/remove.php";
  //static const String favoriteView = "$server/favorite/view.php";
  //static const String deletefromfavroite = "$server/favorite/deletefromfavroite.php";
  // Cart
  // static const String cartview   = "$server/cart/view.php";
  // static const String cartadd    = "$server/cart/add.php";
  // static const String cartdelete = "$server/cart/delete.php";
  // static const String cartgetcountitems = "$server/cart/getcountitems.php";

  // Address

  // static const String addressView = "$server/address/view.php";
  // static const String addressAdd = "$server/address/add.php";
  // static const String addressEdit = "$server/address/edit.php";
  // static const String addressDelete = "$server/address/delete.php";

  // Coupon

  //static const String checkcoupon  = "$server/coupon/checkcoupon.php";

  // Checkout

 // static const String checkout  = "$server/orders/checkout.php";

// Delivery Orders

  static const String viewpendingOrders  = "$server/delivery/orders/pending.php";
  static const String viewacceptedOrders  = "$server/delivery/orders/accepted.php";
  static const String approveOrders  = "$server/delivery/orders/approve.php";
  static const String viewarchiveOrders  = "$server/delivery/orders/archive.php";
  static const String viewdetailsOrders  = "$server/delivery/orders/details.php";
  static const String doneOrders  = "$server/delivery/orders/done.php";

  //static const String ordersdelete  = "$server/orders/delete.php";

  //notification
  static const String notification = "$server/notification.php";
  //-------------------- after 19/2/2025 ---------------------------------------
  //static const String offers = "$server/offers_0.php";
  // static const String offers = "$server/offers.php";
   static const String rating = "$server/rating.php";

}

