import 'package:CenBase/Base/BaseController.dart';
import 'package:CenBase/Widget/LoadingWidget.dart';
import 'package:flutter/material.dart';

class SliverListLoadingWidget extends StatelessWidget {
  const SliverListLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: LoadingWidget(),
      ),
    );
  }
}
