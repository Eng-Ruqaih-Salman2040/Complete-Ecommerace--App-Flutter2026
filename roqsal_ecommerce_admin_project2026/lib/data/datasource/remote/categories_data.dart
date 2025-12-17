
import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class CategoriesData
{
  Crud crud;
  CategoriesData(this.crud);
  //------------------------------------------- Get Data Funcaion -------------------------------------------
  get() async {
    var response = await crud.postData(AppLink.categoriesview,{});
    return response.fold((l) => l, (r) => r);
  }
  //------------------------------------------- Add Data Funcaion -------------------------------------------
  add(Map data,File file) async {
    // Without image
   // var response = await crud.postData(AppLink.categoriesadd, data);
    // With image
    var response = await crud.addRequestWithImageOne(AppLink.categoriesadd, data,file);

    return response.fold((l) => l, (r) => r);
  }
  //------------------------------------------- Edite Data Funcaion -------------------------------------------
  edit(Map data,[File? file]) async {
    var response;
    if(file==null) {
      response = await crud.postData(AppLink.categoriesedit, data);
    }
    else {
      //response = await crud.addRequestWithImageOne(AppLink.categoriesedit, data, file);
        response = await crud.addRequestWithImageOne(AppLink.categoriesedit, data,file);
          }
    return response.fold((l) => l, (r) => r);
  }
  //------------------------------------------- Delete Data Funcaion -------------------------------------------
  delete(Map data) async {
    var response = await crud.postData(AppLink.categoriesdelete, data);
    return response.fold((l) => l, (r) => r);
  }

  /*deleteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersdelete, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }*/
}