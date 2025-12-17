import 'package:roqsal_ecommerce_admin_project2026/data/datasource/remote/categories_data.dart';
import 'package:roqsal_ecommerce_admin_project2026/data/model/categoriesmodel.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../data/datasource/remote/itemss_data.dart';
import '../../data/model/itemsmodel.dart';

class ItemsViewController extends GetxController {
  //TestData testData = TestData(Get.find());
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.get();

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List datalist = response['data'];

        //data.addAll(response['data']);
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteItem(String id, String imagename) {
    itemsData.delete({"id": id, "imagename": imagename}).then((value) {
      print("The Item is Deleted :  $value");
      data.removeWhere((element) => element.itemsId == id);
      update();
      // getData();
    });
  }

  goToPageEdit(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsedit,
        arguments: {"itemsModel": itemsModel});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  myback() {
    Get.offAllNamed(AppRoute.homepage);
    return Future.value(false);
  }
}
