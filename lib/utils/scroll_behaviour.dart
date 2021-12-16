import 'package:flutter/widgets.dart';

class TravaScrollAttitude extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
