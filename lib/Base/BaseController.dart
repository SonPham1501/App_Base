import 'package:CenBase/Utils/DialogUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ViewState { Init, Loading, Loaded, Complete, Error, None, DataNull }

abstract class BaseController extends GetxController {
  Rx<ViewState> viewState = ViewState.Init.obs;

  RxString errorMessage = "".obs;

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  set isLoading(bool value) {
    _isLoading = value;
    if (value) {
      DialogUtil.showLoading();
    } else {
      DialogUtil.hideLoading();
    }
  }


  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {}

  @override
  void onClose() {
    super.onClose();
  }

  void onHideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
