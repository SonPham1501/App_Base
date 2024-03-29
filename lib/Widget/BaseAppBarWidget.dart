import 'package:CenBase/Common/Constant.dart';
import 'package:CenBase/Utils/BaseResourceUtil.dart';
import 'package:CenBase/Utils/FontUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class BaseAppBarWidget extends AppBar {
  final String? textTitle;
  Function()? onback;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color? titleColor;
  final bool isLeadingIcon;
  Widget? iconLeading;
  BuildContext? context;

  BaseAppBarWidget(
      {Key? key,
      this.textTitle,
      @required this.context,
      this.actions,
      this.isLeadingIcon = true,
      this.backgroundColor = Colors.white,
      this.onback, this.iconLeading,
      this.titleColor})
      : super(
          brightness: Brightness.light,
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leading: isLeadingIcon
              ? IconButton(
                  icon: iconLeading ??Padding(
                    padding: const EdgeInsets.all(2),
                    child: SvgPicture.asset(
                      BaseResourceUtil.icon("ic_arrow_left.svg"),
                      color: titleColor ?? Constant.kColorBlackPrimary,
                      width: 12,
                    ),
                  ),
                  onPressed: () {
                    if (onback == null && context != null) {
                      Navigator.of(context).pop();
                    } else {
                      onback!.call();
                    }
                  },
                )
              : null,
          title: Text(
            textTitle ?? "",
            style: TextStyle(
              color: titleColor ?? Constant.kColorBlackPrimary,
              fontFamily: FontUtil.semiBold,
              fontSize: 17,
            ),
          ),
          actions: actions,
          centerTitle: true,
          elevation: 0,
        );
}
