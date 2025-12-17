
import '../../../../core/constant/routes.dart';
import '../../../../core/middleware/mymiddleware.dart';
import '../../../../test_view.dart';
// import '../../../../view/screen/address/add_old.dart';
// import '../../../../view/screen/address/adddetails.dart';
// import '../../../../view/screen/address/view.dart';
import '../../../../view/screen/auth/forgetpassword/forgetpassword.dart';
import '../../../../view/screen/auth/login.dart';
import '../../../../view/screen/auth/forgetpassword/resetpassword.dart';
import '../../../../view/screen/auth/signup.dart';
import '../../../../view/screen/auth/forgetpassword/success_resetpassword.dart';
import '../../../../view/screen/auth/success_signup.dart';
import '../../../../view/screen/auth/forgetpassword/verifycode.dart';
import '../../../../view/screen/auth/verifycodesignup.dart';

import 'view/screen/categories/add.dart';
import 'view/screen/categories/edit.dart';
import 'view/screen/categories/view.dart';
import 'view/screen/home.dart';
import 'view/screen/items/add.dart';
import 'view/screen/items/edit.dart';
import 'view/screen/items/view.dart';
import 'view/screen/orders/screen.dart';

import '../../../../view/screen/language.dart';



import '../../../../view/screen/orders/archive.dart';
import '../../../../view/screen/orders/details.dart';
import '../../../../view/screen/orders/pending.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),
 // GetPage(name: AppRoute.cart, page: () => const Cart()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  //GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  //GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
 // GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
 // GetPage(name: AppRoute.items, page: () => const Items()),
  //GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  //GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  //
  // GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  // GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  // GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  //GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  //GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),

 //GetPage(name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),

  //------------------------ After 19/2/2025 ---------------------
  //GetPage(name: AppRoute.offers, page: () => const OffersView()),

  //--------------------- Admin App Pages -------------------
  // Categories
  GetPage(name: AppRoute.categoriesview, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesadd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesedit, page: () => const CategoriesEdit()),
// Items (Products)
  GetPage(name: AppRoute.itemsview, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsadd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),

  // Orders

  GetPage(name: AppRoute.ordershome, page: () => const OrderScreen()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),




];
