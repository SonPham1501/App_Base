import 'package:CenBase/Base/BaseController.dart';
import 'package:CenBase/Widget/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingWithViewStateWidget extends StatelessWidget {
  final Rx<ViewState> viewState;
  final double size;

  const LoadingWithViewStateWidget({Key? key, required this.viewState, this.size = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ViewState?>(
      stream: viewState.stream,
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.data == ViewState.Loading) {
          return LoadingWidget(size: size,);
        }
        return SizedBox();
      },
    );
  }
}
