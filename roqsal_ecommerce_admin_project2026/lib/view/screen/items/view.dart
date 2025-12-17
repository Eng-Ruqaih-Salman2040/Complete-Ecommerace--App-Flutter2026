import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roqsal_ecommerce_admin_project2026/controller/categories/view_controller.dart';
import 'package:roqsal_ecommerce_admin_project2026/core/class/handlingdataview.dart';
import 'package:roqsal_ecommerce_admin_project2026/linkapi.dart';
import 'package:roqsal_ecommerce_admin_project2026/view/screen/categories/add.dart';

import '../../../controller/items/view_controller.dart';
import '../../../core/constant/routes.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Items"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.itemsadd);
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<ItemsViewController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                //<------- Since WillPopScope is deprecated in Flutter 3.12, you should use PopScope instead.
                // WillPopScope(
                //   onWillPop: (){
                //     return controller.myback();
                //   },
                widget: PopScope(
                  canPop: false,
                  // Prevents default back navigation unless handled
                  onPopInvoked: (didPop) {
                    if (didPop) {
                      return;
                    }
                    controller.myback();
                  },

                  child: Container(
                    child: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){ controller.goToPageEdit(controller.data[index]);},
                            child: Card(
                                child: Row(children: [
                              Expanded(
                                  flex: 2,
                                  child:
                                      CachedNetworkImage(
                                      //SvgPicture.network(  //Not working with png,jpg,.... images only svg images
                                          height: 80,
                                        imageUrl:   "${AppLink.imagestItems}/${controller.data[index].itemsImage}")),
                              Expanded(
                                  flex: 3,
                                  child: ListTile(
                                    title: Text(
                                        controller.data[index].itemsName!),
                                    subtitle:
                                    Column(
                                      children: [
                                        Text("Category =>  ${controller.data[index].categoriesName!}"),
                                        Text(controller.data[index].itemsDate!),
                                      ],
                                    ),

                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                         // IconButton(
                                         //    icon: const Icon(Icons.edit),
                                         //    onPressed: () {
                                         //      //Get.toNamed(AppRoute.editCategories, arguments: controller.data[index]);
                                         //      controller.goToPageEdit(controller.data[index]);
                                         //    },
                                         //  ),
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            Get.defaultDialog(
                                                title: "Warring Delete Items",
                                                middleText:
                                                    "Are you sure you want to delete this item?",
                                                onCancel: () {},
                                                onConfirm: () {
                                                  controller.deleteItem(
                                                      controller.data[index].itemsId!,
                                                      controller.data[index].itemsImage!);
                                                });
                                            //Get.toNamed(AppRoute.editCategories, arguments: controller.data[index]);
                                          },
                                        ),
                                      ],
                                    ),
                                  )),
                            ])),
                          );
                        }),
                  ),
                )))));
  }
}
