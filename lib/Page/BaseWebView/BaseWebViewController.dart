import 'package:CenBase/Base/BaseController.dart';
import 'package:CenBase/CenBase.dart';
import 'package:FlutterBase/Utils/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BaseWebViewController extends BaseController {
//region -------- VALUES --------
  final Function? onSuccess;

  BaseWebViewController({this.onSuccess});

//endregion

//region -------- INIT --------
  @override
  void init() {
    super.init();
    viewState.value = ViewState.Loading;
  }

  @override
  void onClose() {
    super.onClose();
  }

//endregion

//region -------- SERVICE --------

//endregion

//region -------- ACTION FROM VIEW --------
  bool isBack = true;

  void onPageFinished(String url) {
    viewState.value = ViewState.Loaded;
  }
  void onPageStarted(String url) {

  }
//endregion

//region -------- ON CHANGE --------

//endregion

//region -------- FUNCTION --------

//endregion
}
