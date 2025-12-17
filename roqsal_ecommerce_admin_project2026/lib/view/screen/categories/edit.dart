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

import '../../../controller/categories/edit_controller.dart';
import '../../../core/functions/uploadfile.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesEditController controller = Get.put(CategoriesEditController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Categories"),
        ),
        body: GetBuilder<CategoriesEditController>(
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
                              hinttext: "Enter Category Name (English) :",
                              labeltext: "English category name",
                              iconData: Icons.category,
                              mycontroller: controller.name,
                              valid: (val) {
                                return validInput(val!, 1, 30, "name");
                              },
                              isNumber: false),
                          CustomTextFormAuthGlobal(
                              hinttext: "Enter Category Name (Arabic) :",
                              labeltext: "Arabic category name",
                              iconData: Icons.category,
                              mycontroller: controller.namear,
                              valid: (val) {
                                return validInput(val!, 1, 30, "name");
                              },
                              isNumber: false),
                          Container(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                              child: MaterialButton(
                                color: AppColor.thirdColor,
                                textColor: AppColor.secondColor,
                                onPressed: () {
                                  //fileUploadGallry();
                                  controller.chooseImage();
                                },
                                child: const Text(
                                  "Select Category Image",
                                ),
                              )),
                          if (controller.file != null)
                          //Image.file(controller.file!),
                            SvgPicture.file((controller.file!)),
                          CustomButton(
                              text: "Edit",
                              onPressed: () {
                                controller.editData();
                              }),
                          //
                          // ElevatedButton(
                          //     onPressed: () {
                          //       controller.addData();
                          //     },
                          //     child: const Text("Add"))
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
