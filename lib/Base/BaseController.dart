import 'package:CenBase/Utils/DialogUtil.dart';
import 'package:flutter/material.dart';

enum ViewState { Init, Loading, Loaded, Complete, Error, None, DataNull }

class BaseController extends ChangeNotifier {
  ViewState viewState = ViewState.Init;

  String errorMessage = "";

  bool _isLoading = false;

  void setViewState(ViewState viewState) {
    this.viewState = viewState;
    notifyListeners();
  }

  void setErrorLoading(String errMessage) {
    errorMessage = errMessage;
    notifyListeners();
  }

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
    notifyListeners();
  }

  void onHideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
