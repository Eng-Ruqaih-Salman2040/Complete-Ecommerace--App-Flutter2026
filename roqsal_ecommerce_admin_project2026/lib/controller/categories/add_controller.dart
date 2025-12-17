import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:roqsal_ecommerce_admin_project2026/controller/categories/view_controller.dart';
import 'package:roqsal_ecommerce_admin_project2026/core/constant/routes.dart';
import 'package:roqsal_ecommerce_admin_project2026/core/functions/uploadfile.dart';
import 'package:roqsal_ecommerce_admin_project2026/data/datasource/remote/categories_data.dart';
import 'package:roqsal_ecommerce_admin_project2026/data/model/categoriesmodel.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class CategoriesAddController extends GetxController {

  //TestData testData = TestData(Get.find());
  CategoriesData categoriesData=CategoriesData(Get.find());

  //List<CategoriesModel> data = [];
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late  TextEditingController name;
  late  TextEditingController namear;
  StatusRequest? statusRequest=StatusRequest.none;
File? file;
 chooseImage() async {
    file = await fileUploadGallry(true);
    update();
  }

  addData() async {
if(formState.currentState!.validate()) {
  if(file==null){
    Get.snackbar("Warning", "Please select categories image SVG");
  }
  statusRequest = StatusRequest.loading;
  update();
  Map data = {"name": name.text, "namear": namear.text};
  var response = await categoriesData.add(data, file!);

  print("=============================== Controller $response ");

  statusRequest = handlingData(response);

  if (StatusRequest.success == statusRequest) {
    // Start backend
    if (response['status'] == "success") {
      //List datalist=response['data'];
      //data.addAll(response['data']);
      //data.addAll(datalist.map((e)=>CategoriesModel.fromJson(e)));
      Get.offNamed(AppRoute.categoriesview);
      CategoriesViewController categoriesViewController = Get.find();
      categoriesViewController.getData();

    } else {
      statusRequest = StatusRequest.failure;
    }
    // End
  }
  update();
}
  }

  @override
  void onInit() {
    name=TextEditingController();
    namear=TextEditingController();
    //addData();
    super.onInit();
  }
}
