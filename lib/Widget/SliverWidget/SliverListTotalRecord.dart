import 'package:CenBase/Common/Constant.dart';
import 'package:CenBase/Utils/FontUtil.dart';
import 'package:FlutterBase/Utils/Util.dart';
import 'package:flutter/material.dart';

class SliverListTotalRecord extends StatelessWidget {
  final int total;
  final String? contentName;

  const SliverListTotalRecord({Key? key, this.total = 0, this.contentName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: RichText(
                      text: TextSpan(text: "", style: TextStyle(color: Constant.kGreyColor4E, fontSize: 13), children: [
                        TextSpan(
                          text: "${Util.intToPriceDouble(total)} ",
                          style: TextStyle(color: Constant.kGreyColor4E, fontSize: 13, fontFamily: FontUtil.bold),
                        ),
                        TextSpan(
                          text: "${contentName ?? "dữ liệu"}",
                          style: TextStyle(color: Constant.kGreyColor4E, fontSize: 13),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            //Divider(height: 1,)
          ],
        ),
      ),
    );
  }
}
