import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:roqsal_ecommerce_admin_project2026/controller/categories/view_controller.dart';
import 'package:roqsal_ecommerce_admin_project2026/controller/items/view_controller.dart';
import 'package:roqsal_ecommerce_admin_project2026/core/constant/routes.dart';
import 'package:roqsal_ecommerce_admin_project2026/core/functions/uploadfile.dart';
import 'package:roqsal_ecommerce_admin_project2026/data/datasource/remote/categories_data.dart';
import 'package:roqsal_ecommerce_admin_project2026/data/model/categoriesmodel.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/itemss_data.dart';
import '../../data/model/itemsmodel.dart';

class ItemsEditController extends GetxController {
  //TestData testData = TestData(Get.find());
  ItemsData itemsData = ItemsData(Get.find());
  List<SelectedListItem> dropdownList = [];

  //List<CategoriesModel> data = [];
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController count;
  TextEditingController? catid;
  TextEditingController? catname;

  //-------------------------------
  late TextEditingController dropdownname;
  late TextEditingController dropdownid;


  StatusRequest? statusRequest = StatusRequest.none;
  File? file;

  ItemsModel? itemsModel;
  //-----------------------------------------------------
  String? active;
  chooseStatusActive(val) {
    active = val;
    update();
  }
  // showOptionImage() {
  //   showBottomMenu(chooseImageCamera, chooseImageGallery);
  // }
  //
  // chooseImageGallery() async {
  //   file = await fileUploadGallry(false);
  //   update();
  // }
  //
  // chooseImageCamera() async {
  //   file = await imageUploadCamera();
  //   update();
  // }
  //-----------------------------------------------------

  chooseImage() async {
    file = await fileUploadGallry(true);
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      // if(file==null){
      //   Get.snackbar("Warning", "Please select categories image SVG");
      // }
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": itemsModel!.itemsId,
        "imageold": itemsModel!.itemsImage,
        "active": active,
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "price": price.text,
        "discount": discount.text,
        "count": count.text,
        "catid": catid!.text,
        //"catname": catname!.text,
        "datenow": DateTime.now().toString()//catname!.text,
      };
      var response = await itemsData.edit(data, file);

      print("=============================== Controller $response ");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == "success") {
          //List datalist=response['data'];
          //data.addAll(response['data']);
          //data.addAll(datalist.map((e)=>CategoriesModel.fromJson(e)));
          Get.offNamed(AppRoute.itemsview);
          ItemsViewController itemsViewController = Get.find();
          itemsViewController.getData();
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
    itemsModel = Get.arguments['itemsModel'];


    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    count = TextEditingController();
    //---------------------------------------
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();
    //-------------------------------------
    catid = TextEditingController();
    catname = TextEditingController();
    //-------------------------------------------------------------------------------
    name.text = itemsModel!.itemsName!;//categoriesModel!.categoriesName!;
    namear.text = itemsModel!.itemsNameAr!;//categoriesModel!.categoriesNamaAr!;
    desc.text = itemsModel!.itemsDesc!;//categoriesModel!.categoriesDesc!;
    descar.text = itemsModel!.itemsDescAr!;//categoriesModel!.categoriesDescAr!;
    price.text = itemsModel!.itemsPrice!;//categoriesModel!.categoriesPrice!;
    discount.text = itemsModel!.itemsDiscount!;//categoriesModel!.categoriesDiscount!;
    count.text = itemsModel!.itemsCount!;//categoriesModel!.categoriesCount!;
    catid!.text = itemsModel!.categoriesId!;//categoriesModel!.categoriesId!;
    catname!.text = itemsModel!.categoriesName!;//categoriesModel!.categoriesName!;
//-------------------------------------------------------------
    active = itemsModel!.itemsActive!;//categoriesModel!.categoriesActive!;
    //addData();
    super.onInit();
  }
}
