import 'dart:ui';

import 'package:flutter/material.dart';

class Constant{
  static final Color kColorOrangePrimary = Color(0xFFF6891F);
  static final Color kColorBlackPrimary = Color(0xFF14142B);

  static final kGreyColor = Color(0xFF6E7191);
  static final kGreyColor4E = Color(0xFF4E4B66);
  static final kNormalTextColor = Color(0xFF192038);
  static final kTextTitleColor = Color(0xFF5E5873);
  static final kGreenColor = Color(0xFF00BA88);
  static final kRedColor = Color(0xFFFF0000);

  static final kErrorColor = Color(0x33FF3B30);
  static final kLineColor = Color(0xFFDDDEE6);
  static final white = Colors.white;

  static final kColorGreyCC = Color(0xffCCCCCC);
  static final kColorBgE5 = Color(0xffE5E5E5);
  static final kColorBgF5 = Color(0xffF5F7FC);
  static final Color kColorWhite = Colors.white;
  static final Color kColorBlack = Colors.black;
  static final Color kColorDisable = Color(0xffD9DBE9);
  static final Color kColorInputDisable = Color(0xffD9DBE9).withOpacity(0.3);
  static final Color kColorTransparent = Colors.transparent;

  static final Color kColorBorderD9DBE9 = Color(0xffD9DBE9);
  static final Color kColorBorderInput = Color(0xffD9DBE9);
  static final Color kColorBorderInputSelector = Color(0xffF6891F);
  static final Color kColorBlueLink = Color(0xff007AFF);
  static final Color kColorBackground = Color(0xffF3F4F5);
  static final Color kColorBackgroundInput = Color(0xffF8F8FA);
  static final Color kColorBackgroundInputF5 = Color(0xffF5F7FC);
  static final Color kColorBackgroundBack = Color(0xffF4F4F5);
  static final Color kColorRedLine = Color(0xffEE3D48);
  static final Color kColorGreyInactive = Color(0xffE4E9F2);
  static final Color kColorButtonSuccess= Color(0xffD9DBE9);
  static final Color kColorLineDetail = Color(0xFFF5F5F5);

  static final kColorGradientBlue = [Color(0xFF0A69DA),Color(0xFF0856C8),Color(0xFF0231A5)];

  static final Color kColorText6E71 = Color(0xff6E7191);
  static final Color kColorText141 = Color(0xff14142B);

  static final String kFontSF = 'SF';
  static final String kFontRoboto = 'Roboto';

  static final String kAccessToken = "access_token";
  static final String kRefreshToken = "refresh_token";
  static final String kUserInfo = "user_info";
  static final String kHistorySearch = "history_search";
  static final String kHistorySearchUnit = "history_search_unit";
  static final String kAesKey = "as_123_key";
  static final String kFirstLogin = "first_login";
  static final String kKeyboardHeight = "keyboard_height";

  static final String kUserName = "user_name";
  static final String kPassword = "info_user";

  static String? OPERATION_NAME ="widgetsSaveLead";
  static String? QUERY = r'''
  mutation widgetsSaveLead($integrationId: String!, $formId: String!, $submissions: [FieldValueInput], $browserInfo: JSON!, $cachedCustomerId: String) {\n  widgetsSaveLead(integrationId: $integrationId, formId: $formId, submissions: $submissions, browserInfo: $browserInfo, cachedCustomerId: $cachedCustomerId) {\n    status\n    messageId\n    customerId\n    errors {\n      fieldId\n      code\n      text\n      __typename\n    }\n    __typename\n  }\n}\n                                                   
''';

  static String queries= r'''
    mutation widgetsSaveLead($integrationId: String!, $formId: String!, $submissions: [FieldValueInput], $browserInfo: JSON!, $cachedCustomerId: String) {
      widgetsSaveLead(integrationId: $integrationId, formId: $formId, submissions: $submissions, browserInfo: $browserInfo, cachedCustomerId: $cachedCustomerId) {
          status
              messageId
                  customerId
                      errors {
                            fieldId
                                  code
                                        text
                                              __typename
                                                  }
                                                      __typename
                                                        }
                                                        }
                                                                                                                                                  
''';

  static var kIntegrationID = "";
  static var kListUpdated = "list_update";
  static var kFormId = "";

  static String kCachedCustomer = "cach_customer";

  static String IOSLinkStore= "https://apps.apple.com/vn/app/cenhomes/id1462680353?l=vi";

  static var kFileName= "/netWorkLog.txt";
  static var kOldTime= "old_time_log";
  static var kDatabase= "apiLog.db";
  static var kPostUpDatabase= "postUpSave.db";
  static var kTableDatabase= "apiLogTable";
  static var kPostUpTableDatabase= "postUpSaveTable";
  static var kIsCreatTable= "creat_table";

  static var kSocialUrl = "https://social-sandbox.cenhomes.vn";



  static const APT_CM = 'CM';
  static const APT_CB = 'CB';
  static const APT_GCTT = 'GCTT';
  static const APT_LO = 'LO';
  static const APT_DC = 'DC';
  static const APT_HT = 'HT';
  static const APT_HGC = 'HGC';
  static const APT_HDC = 'HDC';
  static const APT_GCTC = 'GCTC';
  static const APT_HGCTC = 'HGCTC';
  static const APT_KNG = 'KNG';

  static const FRIEND_TAG = 'FRIEND_TAG';
  static const GROUP_TAG = 'GROUP_TAG';
  static const GROUP_SINGLE_TAG = 'GROUP__SINGLE_TAG';
  static const NEWFEED_TAG = 'NEWFEED_TAG';
  static const PERSONAL_TAG = 'PERSONAL_TAG';


}