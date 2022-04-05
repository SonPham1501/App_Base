import 'package:CenBase/Utils/BaseResourceUtil.dart';
import 'package:CenBase/Utils/FontUtil.dart';
import 'package:CenBase/Widget/LineBaseWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseAppBarBottomSheetWidget extends StatelessWidget {
  final String? title;

  const BaseAppBarBottomSheetWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
          child: Row(
            children: [
              SizedBox(width: 15),
              Expanded(
                  child: Text(
                    title ?? "",
                    style: TextStyle(
                      fontFamily: FontUtil.bold,
                      fontSize: 18,
                    ),
                  )),
              IconButton(
                onPressed: Navigator.of(context).pop,
                icon: Padding(
                  padding: const EdgeInsets.all(3),
                  child: SvgPicture.asset(BaseResourceUtil.icon("ic_close_bottomsheet")),
                ),
              ),
            ],
          ),
        ),
        LineBaseWidget(),
      ],
    );
  }
}
