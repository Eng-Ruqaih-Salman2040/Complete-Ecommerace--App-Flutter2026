import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roqsal_ecommerce_admin_project2026/controller/categories/add_controller.dart';
import 'package:roqsal_ecommerce_admin_project2026/core/class/handlingdataview.dart';
import 'package:roqsal_ecommerce_admin_project2026/core/constant/color.dart';
import 'package:roqsal_ecommerce_admin_project2026/core/functions/validinput.dart';
import 'package:roqsal_ecommerce_admin_project2026/core/shared/custombutton.dart';
import 'package:roqsal_ecommerce_admin_project2026/core/shared/customtextformauthglobal.dart';

import '../../../controller/items/add_controller.dart';
import '../../../controller/items/edit_controller.dart';
import '../../../core/functions/uploadfile.dart';
import '../../../core/shared/customdropdownsearch.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsEditController controller = Get.put(ItemsEditController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Items"),
        ),
        body: GetBuilder<ItemsEditController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          CustomTextFormAuthGlobal(
                              hinttext: "Item Name (English) :",
                              labeltext: "English item name",
                              iconData: Icons.production_quantity_limits,
                              mycontroller: controller.name,
                              valid: (val) {
                                return validInput(val!, 1, 50, "name");
                              },
                              isNumber: false),
                          CustomTextFormAuthGlobal(
                              hinttext: "Item Name (Arabic) :",
                              labeltext: "Arabic Item name",
                              iconData: Icons.production_quantity_limits,
                              mycontroller: controller.namear,
                              valid: (val) {
                                return validInput(val!, 1, 50, "name");
                              },
                              isNumber: false),
                          //--------------------------- New in Add items -------------------
                          CustomTextFormAuthGlobal(
                              hinttext: "description (English) :",
                              labeltext: "English description",
                              iconData: Icons.production_quantity_limits,
                              mycontroller: controller.desc,
                              valid: (val) {
                                return validInput(val!, 1, 200, "name");
                              },
                              isNumber: false),
                          CustomTextFormAuthGlobal(
                              hinttext: "description (Arabic) :",
                              labeltext: "Arabic description",
                              iconData: Icons.production_quantity_limits,
                              mycontroller: controller.descar,
                              valid: (val) {
                                return validInput(val!, 1, 200, "name");
                              },
                              isNumber: false),
                          CustomTextFormAuthGlobal(
                              hinttext: "Count) :",
                              labeltext: "count",
                              iconData: Icons.production_quantity_limits,
                              mycontroller: controller.count,
                              valid: (val) {
                                return validInput(val!, 1, 30, "name");
                              },
                              isNumber: true),
                          CustomTextFormAuthGlobal(
                              hinttext: "Price) :",
                              labeltext: "price",
                              iconData: Icons.production_quantity_limits,
                              mycontroller: controller.price,
                              valid: (val) {
                                return validInput(val!, 1, 30, "name");
                              },
                              isNumber: true),
                          CustomTextFormAuthGlobal(
                              hinttext: "Discount) :",
                              labeltext: "Discount",
                              iconData: Icons.production_quantity_limits,
                              mycontroller: controller.discount,
                              valid: (val) {
                                return validInput(val!, 1, 30, "name");
                              },
                              isNumber: true),
                          //--------------------------- Video 201 --------------------

                          CustomDropdownSearch(
                              title: "Select Category",
                              /* listdata: [
                                SelectedListItem(name: "a", value: "1"),
                                SelectedListItem(name: "b", value: "2")
                              ],*/
                              listdata: controller.dropdownList,
                              //controller.data,
                              dropdownSelectedName: controller.catname!,
                              //controller.dropdownname,
                              dropdownSelectedId: controller.catid! //controller.dropdownid,
                          ),
                          // CustomDropdownSearch(
                          //   listdata: [],//controller.dropdownname,
                          //   title: "Select Category",
                          //   listdata: controller.data,
                          //   dropdownid: controller.dropdownid,
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          RadioListTile(title:Text("Hide"),value: "0", groupValue: controller.active, onChanged: (val){controller.chooseStatusActive(val);}),
                          RadioListTile(title:Text("Active"),value: "1", groupValue: controller.active, onChanged: (val){controller.chooseStatusActive(val);}),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                              child: MaterialButton(
                                color: AppColor.thirdColor,
                                textColor: AppColor.secondColor,
                                onPressed: () {
                                  //fileUploadGallry();
                                  //controller.chooseImage();
                                 //controller.showOptionImage();
                                },
                                child: const Text(
                                  "Select Item Image",
                                ),
                              )),

                          if (controller.file != null)
                            Image.file(controller.file!),
                          //SvgPicture.file((controller.file!)),
                          CustomButton(
                              text: "Edit and Save",
                              onPressed: () {
                               controller.editData();
                              }),
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
