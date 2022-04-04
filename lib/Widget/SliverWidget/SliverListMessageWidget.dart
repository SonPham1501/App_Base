import 'package:CenBase/Base/BaseController.dart';
import 'package:CenBase/Common/Constant.dart';
import 'package:CenBase/Utils/BaseResourceUtil.dart';
import 'package:CenBase/Utils/FontUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliverListMessageWidget extends StatelessWidget {
  final String? title;
  final ViewState viewState;

  const SliverListMessageWidget({Key? key, this.title, this.viewState = ViewState.None}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Center(
                child: Text(
              "${title ?? "Không có dữ liệu"}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontFamily: FontUtil.regular, color: Constant.kColorText141),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Image.asset(
              BaseResourceUtil.icon("bg_error.png"),
              width: Get.width * 0.7,
              height: Get.height * 0.4,
            ),
          )
        ],
      ),
    );
  }
}
