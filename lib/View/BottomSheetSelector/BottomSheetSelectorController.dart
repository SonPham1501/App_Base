import 'package:CenBase/Base/BaseController.dart';
import 'package:CenBase/CenBase.dart';
import 'package:CenBase/Model/GroupSelectorModel.dart';
import 'package:CenBase/Model/SelectorModel.dart';
import 'package:FlutterBase/Utils/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomSheetSelectorController extends BaseController {
//region -------- VALUES --------
  final bool isMultiSelect;
  final Function(List<SelectorModel> list)? onSuccess;
  final List<SelectorModel> list;
  var listSelector = <SelectorModel>[].obs;
  var textSearchController = TextEditingController();
  BuildContext? context;

  BottomSheetSelectorController({required this.isMultiSelect, this.onSuccess, required this.list});

//endregion

//region -------- INIT --------
  @override
  void init() {
    super.init();
    print("Fucl");
    viewState.value = ViewState.Loading;
    for (var item in list) {
      listSelector.add(item);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

//endregion

//region -------- SERVICE --------

//endregion

//region -------- ACTION FROM VIEW --------

  void onSelect(SelectorModel selectorModel) {
    if (isMultiSelect) {
      if (context != null) {
        onHideKeyboard(context!);
      }
      selectorModel.isCheck = !selectorModel.isCheck;
      listSelector.refresh();
    } else {
      listSelector.forEach((element) {
        element.isCheck = false;
      });
      selectorModel.isCheck = !selectorModel.isCheck;
      if (context != null) {
        onHideKeyboard(context!);
      }
      onSuccess?.call(list);
      Get.back();
    }
  }

  void onResetValue() {
    for (var item in listSelector) {
      item.isCheck = false;
    }
    listSelector.refresh();
  }

  void onSubmit() {
    onSuccess?.call(listSelector);
    Get.back();
  }

//endregion

//region -------- ON CHANGE --------
  void onChangeTextSearch(String value) {
    listSelector.clear();
    if (textSearchController.text.length == 0) {
      for (var item in list) {
        listSelector.add(item);
      }
    } else {
      var textSearch = Util.nonUnicode(textSearchController.text.trim()).toLowerCase();
      for (var item in list) {
        if (Util.nonUnicode(item.title).toLowerCase().contains(textSearch)) {
          listSelector.add(item);
        }
      }
    }
    listSelector.refresh();
  }
//endregion

//region -------- FUNCTION --------

//endregion
}
