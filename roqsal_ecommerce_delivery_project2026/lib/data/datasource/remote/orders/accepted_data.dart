import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData(String deliverid) async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {"id": deliverid});
    return response.fold((l) => l, (r) => r);
  }

  doneDelivery(String ordersid,String userid) async {
    var response = await crud.postData(AppLink.doneOrders, {"ordersid": ordersid,"usersid": userid});
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
