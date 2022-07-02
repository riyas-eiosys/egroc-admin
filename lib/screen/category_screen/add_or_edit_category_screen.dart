import 'dart:io';

import 'package:e_groccer_admin/core/packages/image_picker.dart';
import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:e_groccer_admin/models/category_model/datum.dart';
import 'package:e_groccer_admin/shared_widget/appbar.dart';
import 'package:e_groccer_admin/shared_widget/button.dart';
import 'package:e_groccer_admin/shared_widget/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart' hide MultipartFile;
import '../../core/utils/helper.dart' as helper;

import 'all_category_controller.dart';

class AddEditCategoryScreen extends StatefulWidget {
  const AddEditCategoryScreen(
      {Key? key,
      this.isEdit = false,
      this.data,
      required this.isSubCategory,
      this.parentId})
      : super(key: key);
  final bool isEdit;
  final bool isSubCategory;
  final CategoryData? data;
  final int? parentId;

  @override
  State<AddEditCategoryScreen> createState() => _AddEditCategoryScreenState();
}

class _AddEditCategoryScreenState extends State<AddEditCategoryScreen> {
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;

  unfocus() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  final _formKey = GlobalKey<FormState>();
  File? image;
  int priority = 0;

  @override
  void initState() {
    controller.priority = 0;
    nameController =
        TextEditingController(text: widget.isEdit ? widget.data?.name : "");
    descriptionController = TextEditingController(
        text: widget.isEdit ? widget.data?.description : "");
    if (widget.isEdit) {
      controller.isEnable = widget.data?.enabled ?? false;
      controller.isFeatured = widget.data?.featured ?? false;
      controller.priority = widget.data?.priority ?? 0;
    }
    // TODO: implement initState
    super.initState();
  }

  CategoryController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: unfocus,
        child: Scaffold(
            appBar: AppBarCustoms(
                title: widget.isEdit
                    ? "Edit "
                    : "Add ${widget.isSubCategory ? "Sub Category" : "Category"}"),
            body: GetBuilder<CategoryController>(builder: (categoryController) {
              return Form(
                key: _formKey,
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.sp, vertical: 24.sp),
                  children: [
                    CustomSwitch(
                        name: "Enabled", value: categoryController.isEnable),
                    SizedBox(
                      height: 22.sp,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12.sp,
                    ),
                    TextFormFieldCustom(
                        validator: (v) {
                          if (v!.length < 3) {
                            return "Enter a valid Name";
                          }
                          return null;
                        },
                        controller: nameController,
                        hint: "Enter Name"),
                    SizedBox(
                      height: 12.sp,
                    ),
                    Text(
                      "Image",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12.sp,
                    ),
                    Container(
                      height: 48.sp,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(color: const Color(0xFFD4D1D7))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12.sp,
                          ),
                          Text(
                            (image != null) ? "Image Selected" : "Upload Image",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: (image != null)
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: (image != null)
                                    ? CustomColors.dark1
                                    : CustomColors.dark2),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => FilePickerDialog(
                                  onFilePicked: (file) async {
                                    image = await helper.cropImage(file);
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                            child: Container(
                              height: 48.sp,
                              width: 48.sp,
                              decoration: BoxDecoration(
                                  color: CustomColors.green,
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.sp,
                    ),
                    CustomSwitch(
                        name: "Featured", value: categoryController.isFeatured),
                    SizedBox(
                      height: 24.sp,
                    ),
                    Text(
                      "Priority",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12.sp,
                    ),
                    AddPriorityItem(value: categoryController.priority),
                    SizedBox(
                      height: 24.sp,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12.sp,
                    ),
                    TextFormFieldCustom(
                      controller: descriptionController,
                      hint: "Enter Description",
                      minLines: 6,
                    ),
                    SizedBox(
                      height: 38.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: "Reset",
                          width: 110.sp,
                          borderColor: CustomColors.blue,
                          textColor: CustomColors.blue,
                          buttonColor: Colors.white,
                          onPressed: () {
                            if (widget.isEdit) {
                              nameController.text = widget.data?.name ?? "";
                              descriptionController.text =
                                  widget.data?.description ?? "";
                              controller.isEnable =
                                  widget.data?.enabled ?? false;
                              controller.isFeatured =
                                  widget.data?.featured ?? false;
                              controller.priority = widget.data?.priority ?? 0;
                            } else {
                              nameController.clear();
                              descriptionController.clear();
                              categoryController.isEnable = false;
                              categoryController.isFeatured = false;
                              categoryController.priority = 0;
                              image = null;
                            }
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 12.sp,
                        ),
                        CustomButton(
                          text: "Save",
                          width: 110.sp,
                          onPressed: () async {
                            if (_formKey.currentState?.validate() == true) {
                              // print("Image path ${image?.path}");
                              // print(
                              //     "Image name ${image?.path.split(Platform.pathSeparator).last}");
                              if (widget.isEdit) {
                                if (widget.isSubCategory) {
                                  categoryController.editSubCategory(data: {
                                    "enabled": categoryController.isEnable,
                                    "name": nameController.text,
                                    "icon": "",
                                    "image": "",
                                    //  await MultipartFile.fromFile(
                                    //     image?.path ?? "",
                                    //     filename: image?.path
                                    //         .split(Platform.pathSeparator)
                                    //         .last),
                                    "description": descriptionController.text,
                                    "priority": categoryController.priority,
                                    "featured": categoryController.isFeatured,
                                    "parent": widget.parentId!
                                  }, id: widget.data?.id ?? 0);
                                } else {
                                  categoryController.editCategory(data: {
                                    "enabled": categoryController.isEnable,
                                    "name": nameController.text,
                                    "icon": "",
                                    "image": "",
                                    //  await MultipartFile.fromFile(
                                    //     image?.path ?? "",
                                    //     filename: image?.path
                                    //         .split(Platform.pathSeparator)
                                    //         .last),
                                    "description": descriptionController.text,
                                    "priority": categoryController.priority,
                                    "featured": categoryController.isFeatured,
                                    "parent": null
                                  }, id: widget.data?.id ?? 0);
                                }
                              } else {
                                if (widget.isSubCategory) {
                                  categoryController.addSubCategory(data: {
                                    "enabled": categoryController.isEnable,
                                    "name": nameController.text,
                                    "icon": "",
                                    "image": "",
                                    // await MultipartFile.fromFile(
                                    //     image?.path ?? "",
                                    //     filename: image?.path
                                    //         .split(Platform.pathSeparator)
                                    //         .last),
                                    "description": descriptionController.text,
                                    "priority": categoryController.priority,
                                    "featured": categoryController.isFeatured,
                                    "parent": widget.parentId
                                  });
                                } else {
                                  categoryController.addCategory(data: {
                                    "enabled": categoryController.isEnable,
                                    "name": nameController.text,
                                    "icon": "",
                                    "image": "",
                                    // await MultipartFile.fromFile(
                                    //     image?.path ?? "",
                                    //     filename: image?.path
                                    //         .split(Platform.pathSeparator)
                                    //         .last),
                                    "description": descriptionController.text,
                                    "priority": categoryController.priority,
                                    "featured": categoryController.isFeatured,
                                    "parent": null
                                  });
                                }
                              }
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 38.sp,
                    ),
                  ],
                ),
              );
            })));
  }
}

class AddPriorityItem extends StatefulWidget {
  AddPriorityItem({Key? key, required this.value}) : super(key: key);
  int value;

  @override
  State<AddPriorityItem> createState() => _AddPriorityItemState();
}

class _AddPriorityItemState extends State<AddPriorityItem> {
  CategoryController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.sp,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(color: const Color(0xFFD4D1D7))),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.05,
            child: InkWell(
              onTap: () {
                if (widget.value == 0) {
                } else {
                  widget.value--;

                  setState(() {});
                }
                controller.priority = widget.value;
              },
              child: Container(
                height: 48.sp,
                width: 48.sp,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFD4D1D7)),
                    borderRadius: BorderRadius.circular(10.sp)),
                child: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Spacer(),
          Text(
            widget.value.toString(),
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: CustomColors.dark1),
          ),
          const Spacer(),
          Transform.scale(
            scale: 1.05,
            child: InkWell(
              onTap: () {
                widget.value++;
                controller.priority = widget.value;
                setState(() {});
              },
              child: Container(
                height: 48.sp,
                width: 48.sp,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFD4D1D7)),
                    borderRadius: BorderRadius.circular(10.sp)),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  CustomSwitch({Key? key, required this.name, required this.value})
      : super(key: key);
  String name;
  bool value;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  CategoryController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.name,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 16.sp,
        ),
        FlutterSwitch(
          value: widget.value,
          onToggle: (v) {
            widget.value = !widget.value;
            if (widget.name == "Enabled") {
              controller.isEnable = widget.value;
            } else {
              controller.isFeatured = widget.value;
            }
            setState(() {});

            // controller.update();
          },
          width: 34.sp,
          height: 16.sp, padding: 2,
          // borderRadius: 6.sp,
          toggleSize: 12.sp, activeColor: CustomColors.green,
          inactiveColor: CustomColors.red,
        ),
      ],
    );
  }
}
