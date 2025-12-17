import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:roqsal_ecommerce_admin_project2026/core/constant/imgaeasset.dart';

import '../../../../controller/home_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../widget/home/cardadmin.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
          ScreenTypeLayout(
          mobile: Container(color:Colors.blue),
          tablet: Container(color: Colors.yellow),
        desktop: Container(color: Colors.red),
        watch: Container(color: Colors.purple),
      ),
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //crossAxisCount: 3,
          crossAxisCount: getValueForScreenType<int>(
            context: context,
            mobile: 3,
            tablet: 4,
            desktop: 5,
          ),


                    mainAxisExtent: 150),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  CardAdminHome(
                    url: AppImageAsset.notificationsImage,
                    title: 'Categories',
                    onClick: () {
                      Get.toNamed(AppRoute.categoriesview);
                    },
                  ),
                  CardAdminHome(
                    url: AppImageAsset.productsImage,
                    title: 'Products',
                    onClick: () {
                      Get.toNamed(AppRoute.itemsview);
                    },
                  ),
                  CardAdminHome(
                    url: AppImageAsset.messageImage,
                    title: 'Users',
                    onClick: () {},
                  ),
                  CardAdminHome(
                    url: AppImageAsset.productsImage,
                    title: 'Orders',
                    onClick: () {
                      Get.toNamed(AppRoute.ordershome);

                    },
                  ),
                  CardAdminHome(
                    url: AppImageAsset.messageImage,
                    title: 'Messages',
                    onClick: () {},
                  ),
                  CardAdminHome(
                    url: AppImageAsset.notificationsImage,
                    title: 'Notifications',
                    onClick: () {},
                  ),

                ],
              ),
            ],
          )),
    );
  }
}
