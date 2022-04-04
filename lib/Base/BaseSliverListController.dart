import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'BaseController.dart';

class BaseSliverListController extends BaseController {
  var refreshController = RefreshController(initialRefresh: false);
  var scrollController = ScrollController();
  Rx<bool> isLoadMore = false.obs;
  bool isLoad = false; //đang load api không load thêm
  bool isEnd = false; //đã hết bản ghi
  int page = 1; //trang
  var countFilter = 0.obs; //số lượng filter
  var countRecord = 0.obs; //số lượng bản ghi

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {}

  void clearData() {
    isLoad = false;
    isEnd = false;
    page = 1;
  }

  void checkData({required List listShow, required List listDataApi, int? totalRecord}) {
    if (totalRecord != null) {
      countRecord.value = totalRecord;
    }
    if (listShow.isEmpty) {
      viewState(ViewState.DataNull);
    } else {
      viewState.value = ViewState.Loaded;
    }
    if (listDataApi.length == 0 || totalRecord == listShow.length) {
      isEnd = true;
      isLoadMore(false);
    }
  }
}
