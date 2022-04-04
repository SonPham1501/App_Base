import 'package:CenBase/Base/BaseController.dart';
import 'package:CenBase/CenBase.dart';
import 'package:CenBase/Utils/BaseResourceUtil.dart';
import 'package:CenBase/Widget/LoadingWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:interactiveviewer_gallery/interactiveviewer_gallery.dart';

import 'PhotoController.dart';
import 'Widget/CachedImage.dart';
import 'Widget/DisplayGesture.dart';

class PhotoViewPage extends StatelessWidget {
  List<String>? medias;

  String? tagHero;
  int index;
  String? tag;

  PhotoViewPage({this.medias, this.tagHero, required this.index, this.tag});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhotoController(medias: medias), tag: tag);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          DisplayGesture(
            child: InteractiveviewerGallery<String>(
              sources: medias!,
              initIndex: index,
              itemBuilder: (BuildContext context, int index, bool isFocus) {
                return _buildItemWidget(index, controller);
              },
              onPageChanged: (int pageIndex) {
                controller.indexSelector.value = pageIndex;
              },
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 0,
                ),
                child: Row(
                  children: [
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${controller.indexSelector.value + 1}/${medias?.length ?? ""}",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }),
                    IconButton(
                      icon: SvgPicture.asset(
                        BaseResourceUtil.icon("ic_close_x.svg"),
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildItemWidget(int index, PhotoController controller) {
    if (controller.viewState.value == ViewState.Loading) {
      return LoadingWidget();
    } else {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        // onTap: () => Get.back(),
        child: Center(
          child: Hero(
            tag: controller.mediasRx[index],
            // child: CachedImage(
            //   ProjectUtil.getUrlImageWithGuild(guid: controller.mediasRx[index].guid ?? ""),
            //   fit: BoxFit.contain,
            // ),
            child: CachedImage(
              controller.mediasRx[index],
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
      //}
    }
  }
}
