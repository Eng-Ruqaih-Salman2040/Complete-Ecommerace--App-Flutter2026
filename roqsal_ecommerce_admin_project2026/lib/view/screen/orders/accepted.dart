import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:roqsal_ecommerce_delivery_project2026/controller/orders/accepted_controller.dart';
//import 'package:roqsal_ecommerce_delivery_project2026/view/widget/orders/orderslistcardaccepted.dart';

import '../../../../core/class/handlingdataview.dart';
import '../../../controller/orders/accepted_controller.dart';
import '../../widget/orders/orderslistcardaccepted.dart';

class OrdersAccepted extends StatelessWidget {
  const OrdersAccepted({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Orders'),
      // ),
        body: Container(
          padding:const  EdgeInsets.all(10),
          child: GetBuilder<OrdersAcceptedController>(
              builder: ((controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: ((context, index) =>
                    CardOrdersListAccepted(listdata: controller.data[index])),
              )))),
        ));
  }
}
