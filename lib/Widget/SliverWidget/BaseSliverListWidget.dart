import 'package:CenBase/Base/BaseController.dart';
import 'package:CenBase/Base/BaseSliverListController.dart';
import 'package:CenBase/Common/Constant.dart';
import 'package:CenBase/Widget/SliverWidget/SliverListLoadingWidget.dart';
import 'package:CenBase/Widget/SliverWidget/SliverListTotalRecord.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'SliverListErrorWidget.dart';
import 'SliverListLoadMoreWidget.dart';
import 'SliverListMessageWidget.dart';

class BaseSliverListWidget extends StatelessWidget {
  final Function? onLoadMore;
  final Function? onRefresh;
  final Widget? childHeader;
  final Widget? childList;
  final BaseSliverListController controller;
  final bool isBottomSafeArea;
  final bool isShowTotalRecord;
  final String? contentTotalRecord;

  const BaseSliverListWidget({
    Key? key,
    required this.controller,
    this.onLoadMore,
    this.onRefresh,
    this.childHeader,
    this.childList,
    this.isBottomSafeArea = true,
    this.isShowTotalRecord = false,
    this.contentTotalRecord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var controller = Get.find<BaseSliverListController>(tag: tag);
    return Obx(
      () {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
              print("--onLoadMore");
              onLoadMore?.call();

            }
            return true;
          },
          child: SmartRefresher(
            header: MaterialClassicHeader(
              color: Constant.kColorOrangePrimary,
            ),
            controller: controller.refreshController,
            onRefresh: () {
              onRefresh?.call();
            },
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                if (childHeader != null) childHeader!,
                if (controller.viewState.value == ViewState.Loading) ...[
                  SliverListLoadingWidget(),
                ],
                if (controller.viewState.value == ViewState.Loaded || controller.viewState.value == ViewState.Complete) ...[
                  if (isShowTotalRecord)
                    Obx(() => SliverListTotalRecord(
                          total: controller.countRecord.value,
                          contentName: contentTotalRecord,
                        )),
                  if (childList != null) childList!,
                  SliverListLoadMoreWidget(
                    loadMore: controller.isLoadMore,
                  ),
                ],
                if (controller.viewState.value == ViewState.Error) ...[
                  SliverListMessageWidget(
                    title: controller.errorMessage.value,
                  ),
                ],
                if (controller.viewState.value == ViewState.DataNull) ...[
                  SliverListMessageWidget(
                    title: "Không có dữ liệu",
                  ),
                ],
                if (isBottomSafeArea)
                  SliverToBoxAdapter(
                    child: SafeArea(
                      top: false,
                      child: SizedBox(),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
