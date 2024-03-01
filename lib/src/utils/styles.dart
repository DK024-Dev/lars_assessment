import 'package:infinite_list_assesment/src/core/configuration.dart';

class AppTextStyle {
  static TextStyle regularTextStyle = TextStyle(
    fontSize: 14,
    color: ColorConstant.blackColor,
  );

  static TextStyle smallTextStyle = TextStyle(
    fontSize: 12,
    color: ColorConstant.blackColor.withOpacity(0.6),
  );

  static TextStyle appBarTextStyle = TextStyle(
    color: ColorConstant.blackColor,
    fontSize: 16,
    letterSpacing: 1,
    fontWeight: FontWeight.w600,
  );
}
