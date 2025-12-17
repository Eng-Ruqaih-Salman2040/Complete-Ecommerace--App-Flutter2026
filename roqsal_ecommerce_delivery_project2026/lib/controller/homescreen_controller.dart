import '../../../view/screen/home.dart';
// import '../../../view/screen/notification.dart';
// import '../../../view/screen/offers.dart';
// import '../../../view/screen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/Orders.dart';
import '../view/screen/orders/accepted.dart';
import '../view/screen/orders/pending.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
   // const HomePage(),
    const OrdersPending(),
    //NotificationView() ,
    //OffersView(),
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [Center(child: Text("Profile"))],
    // ),
    //Text("Pending"),
   const OrdersAccepted(),
    Text("Settings"),
  ];

  List bottomappbar = [
    {"title": "Pending", "icon": Icons.home},
    //{"title": "notifications", "icon": Icons.notifications_active_outlined},
    //{"title": "offers", "icon": Icons.offline_bolt_outlined},
    {"title": "Accepted", "icon": Icons.shopping_bag_outlined},
    {"title": "Settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
