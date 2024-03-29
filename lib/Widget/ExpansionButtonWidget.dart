import 'package:CenBase/Common/Constant.dart';
import 'package:FlutterBase/Widget/ExpandedSectionWidget.dart';
import 'package:flutter/material.dart';

class ExpansionButtonWidget extends StatefulWidget {
  final Widget? child;
  final EdgeInsets? paddingButton;

  const ExpansionButtonWidget({Key? key, this.child, this.paddingButton}) : super(key: key);

  @override
  _ExpansionButtonWidgetState createState() => _ExpansionButtonWidgetState();
}

class _ExpansionButtonWidgetState extends State<ExpansionButtonWidget> {
  bool isExpansion = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (widget.child != null)
            ExpandedSectionWidget(
              child: widget.child!,
              expand: isExpansion,
            ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setState(() {
                isExpansion = !isExpansion;
              });
            },
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: widget.paddingButton ?? const EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: Row(
                  children: [
                    Text(
                      isExpansion ? "Rút gọn" : "Xem thêm",
                      style: TextStyle(
                        color: Constant.kColorBlueLink,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      isExpansion ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined,
                      color: Constant.kColorBlueLink,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
