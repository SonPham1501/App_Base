import 'package:CenBase/Base/BaseController.dart';
import 'package:CenBase/Common/Constant.dart';
import 'package:CenBase/Utils/BaseProjectUtil.dart';
import 'package:CenBase/Widget/BaseAppBarWidget.dart';
import 'package:CenBase/Widget/LineBaseWidget.dart';
import 'package:CenBase/Widget/LoadingWidget.dart';
import 'package:FlutterBase/Utils/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'BaseWebViewController.dart';

// ignore: must_be_immutable
class BaseWebViewPage extends StatelessWidget {
  final String url;
  final String? title;
  final bool isShowShare;
  final Function? onSuccess;
  late BaseWebViewController controller;
  final ScrollController _scrollController = ScrollController();

  BaseWebViewPage({Key? key, required this.url, this.onSuccess, this.title, this.isShowShare = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("PaymentMethodPage");
    controller = Get.put(BaseWebViewController(onSuccess: onSuccess));
    return Scaffold(
      backgroundColor: Constant.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => controller.onHideKeyboard(context),
        child: Column(
          children: [
            BaseAppBarWidget(
              context: context,
              textTitle: title ?? "",
              actions: [
                if (isShowShare)
                  PopupMenuButton(
                      offset: const Offset(0, 50),
                      onSelected: (value) {
                        if (value == 1) {
                          BaseProjectUtil.share(title: url);
                        }
                        if (value == 2) {
                          Util.launchURL(url);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.more_vert_rounded,
                          color: Constant.kColorBlackPrimary,
                        ),
                      ),
                      itemBuilder: (context) => [
                            const PopupMenuItem(
                              child: Text("Chia sẻ"),
                              value: 1,
                            ),
                            const PopupMenuItem(
                              child: Text("Mở trong trình duyệt"),
                              value: 2,
                            )
                          ])
              ],
            ),
            LineBaseWidget(),
            Expanded(
              child: Stack(
                children: [
                  ClipRect(
                    child: WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: this.url,
                      onPageFinished: (value) {
                        controller.onHideKeyboard(context);
                        controller.viewState.value = ViewState.Loaded;
                      },
                      onProgress: (value) {
                        controller.viewState.value = ViewState.Loading;
                      },
                    ),
                  ),
                  Obx(() {
                    if (controller.viewState.value == ViewState.Loading) {
                      return Positioned(
                        child: Center(
                          child: LoadingWidget(),
                        ),
                      );
                    }
                    return SizedBox();
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
