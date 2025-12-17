import 'package:cached_network_image/cached_network_image.dart';
import '../../../../controller/home_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/routes.dart';
import '../../../../data/model/itemsmodel.dart';
import '../../../../linkapi.dart';
// import '../../../../view/widget/customappbar.dart';
// import '../../../../view/widget/home/customcardhome.dart';
// import '../../../../view/widget/home/customtitlehome.dart';
// import '../../../../view/widget/home/listcategorieshome.dart';
// import '../../../../view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                // CustomAppBar(
                //   mycontroller: controller.search!,
                //   titleappbar: "Find Product",
                //   // onPressedIcon: () {},
                //   onPressedSearch: () {
                //     controller.onSearchItems();
                //   },
                //   onChanged: (val) {
                //     controller.checkSearch(val);
                //   },
                //   onPressedIconFavorite: () {
                //     Get.toNamed(AppRoute.myfavroite);
                //   },
                // ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text("Delivery Home Page ",
                                    style: const TextStyle(fontSize: 20)),
                              ),
                             // if (controller.settingdata.isNotEmpty)
                             //    CustomCardHome(
                             //        title:
                             //            "${controller.titleHomeCard}",
                             //        // "${controller.settingdata[0]['settings_titlehome']}",
                             //        //"A summer surprise",
                             //        body:
                             //            "${controller.bodyHomeCard}"),
                             //            //"${controller.settingdata[0]['settings_bodyhome']}"),
                             //  //"Cashback 20%"),
                             //  const CustomTitleHome(title: "Categories"),
                             //  const ListCategoriesHome(),
                             //  const CustomTitleHome(title: "Product for you"),
                             //  const ListItemsHome(),
                            ],
                          )
                        : Column(
                          children: [
                            Center(
                              child: Text("Delivery Home Page ",
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          ],
                        )),

                // const CustomTitleHome(title: "Offer"),
                // const ListItemsHome()
              ],
            )));
  }
}


