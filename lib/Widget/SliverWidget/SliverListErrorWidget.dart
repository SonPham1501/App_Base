import 'package:CenBase/Common/Constant.dart';
import 'package:CenBase/Utils/BaseResourceUtil.dart';
import 'package:CenBase/Utils/FontUtil.dart';
import 'package:flutter/cupertino.dart';

class SliverListErrorWidget extends StatelessWidget {
  final String? errorMessage;
  final Size? size;

  SliverListErrorWidget({this.errorMessage, this.size});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Center(
                child: Text(
                  "$errorMessage",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontFamily: FontUtil.regular, color: Constant.kColorText141),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Image.asset(
              BaseResourceUtil.icon("bg_error.png"),
              width: (size?.width ?? 0) * 0.7,
              height: (size?.height ?? 0) * 0.4,
            ),
          )
        ],
      ),
    );
  }
}
