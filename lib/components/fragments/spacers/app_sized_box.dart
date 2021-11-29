import 'package:flutter/widgets.dart';

import 'package:trava/utils/dimensions.dart';

class TravaSizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;

  const TravaSizedBox({this.height = 0, this.width = 0, this.child});

  @override
  Widget build(BuildContext context) {
    final sizer = TravaScaleUtil(context).sizer;
    return SizedBox(
      height: sizer.setHeight(height),
      width: sizer.setWidth(width),
      child: child,
    );
  }
}
