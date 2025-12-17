import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersPendingData {
  Crud crud;

  OrdersPendingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewpendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrder(String deliveryid, String userid, String orderid) async {
    var response = await crud.postData(AppLink.approveOrders,
        {"deliveryid": deliveryid, "usersid": userid, "ordersid": orderid});
    return response.fold((l) => l, (r) => r);
  }
/*deleteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersdelete, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }*/
}
