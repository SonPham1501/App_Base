import 'dart:io';

import 'package:CenBase/Model/BaseLoadMoreModel.dart';
import 'package:CenBase/Widget/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliverListLoadMoreWidget extends StatelessWidget {
  final Rx<bool> loadMore;

  const SliverListLoadMoreWidget({Key? key, required this.loadMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (loadMore.value) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(child: LoadingWidget(size: 24,strokeWidth: 1,)),
          ),
        );
      }
      return SliverToBoxAdapter();
    });
  }
}
