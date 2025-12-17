import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersAcceptedData {
  Crud crud;

  OrdersAcceptedData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  donePrepare(String ordersid, String userid, String ordertype) async {
    var response = await crud.postData(AppLink.prepare,
        {"ordersid": ordersid, "usersid": userid, "ordertype": ordertype});
    return response.fold((l) => l, (r) => r);
  }
/*deleteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersdelete, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }*/

// $orderid = filterRequest("ordersid");
//
// $userid = filterRequest("usersid");
}
