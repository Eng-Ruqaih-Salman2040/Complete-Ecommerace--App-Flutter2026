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
import 'package:drop_down_list/drop_down_list.dart';

class ItemsAddController extends GetxController {
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

  //--------------------------------------------

//----------------------- Choose Item image ----------------------
  chooseImage() async {
    file = await fileUploadGallry(true);
    update();
  }

  showOptionImage() {
    showBottomMenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageGallery() async {
    file = await fileUploadGallry(false);
    update();
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  //------------------------------------

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) {
        Get.snackbar("Warning", "Please select item image");
      }
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
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

      var response = await itemsData.add(data, file!);

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

//------------------------------------202 VIDEO   ------------------------------
  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    //data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
        //  dropdownList = data.map((e) => SelectedListItem(name: e.name, value: e.id)).toList();

        for (int i = 0; i < data.length; i++) {
          dropdownList.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId!));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getCategories();
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

    //addData();
    super.onInit();
  }

  //------------------------------------200 VIDEO   ------------------------------
  showDropDownList(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [SelectedListItem(name: "a"), SelectedListItem(name: "b")],
        //widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {
          //--------------------- Multi Selected Orginal Code -----------
          /*  List<String> list = [];
        for(var item in selectedList) {
            if(item is SelectedListItem) {
              list.add(item.name);
            }
          }*/
          //-------------------------- I Updated Code to select curent index  -------------------
          SelectedListItem selectedListItem = selectedList[0];
          dropdownname.text = selectedListItem.name;
          //showSnackBar(list.toString());
        },
        //enableMultipleSelection: true,
      ),
    ).showModal(context);
  }
}
