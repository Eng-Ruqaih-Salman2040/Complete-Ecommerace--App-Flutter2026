import 'package:roqsal_ecommerce_admin_project2026/data/datasource/remote/categories_data.dart';
import 'package:roqsal_ecommerce_admin_project2026/data/model/categoriesmodel.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class CategoriesViewController extends GetxController {
  //TestData testData = TestData(Get.find());
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List datalist = response['data'];

        //data.addAll(response['data']);
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteCategory(String id, String imagename) {
    categoriesData.delete({"id": id, "imagename": imagename}).then((value) {
      print("The Category is Deleted :  $value");
      data.removeWhere((element) => element.categoriesId == id);
      update();
      // getData();
    });
  }

  goToPageEdit(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoute.categoriesedit,
        arguments: {"categoriesModel": categoriesModel});
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
