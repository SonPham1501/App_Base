import 'package:CenBase/Base/BaseController.dart';
//import 'package:CenHomesListing/Page/ProjectDetail/Widget/Slider/SliderDetailController.dart';

import 'package:get/get.dart';
class PhotoController extends BaseController {
  int index;

  List<String>? medias;

  var mediasRx = <String>[].obs;
  var indexSelector = 0.obs;

  PhotoController({required this.medias, this.index = 0});

  @override
  void init() {
    viewState(ViewState.Loading);
    if (medias != null && medias!.length > 0) {
      mediasRx.value = medias!;

    }
    mediasRx.refresh();
    viewState(ViewState.Loaded);
    super.init();
  }
}
