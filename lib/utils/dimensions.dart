import 'package:flutter/widgets.dart'
    show
        BuildContext,
        MediaQuery,
        MediaQueryData,
        EdgeInsets,
        RenderBox,
        Offset;
import 'package:trava/models/enums/screen_type.dart';

class _TravaDimension {
  late MediaQueryData _queryData;
  _TravaDimension(BuildContext context) {
    _queryData = MediaQuery.of(context);
  }

  ScreenType get screenType {
    if (_queryData.size.width > 500) return ScreenType.TABLET;
    return ScreenType.MOBILE;
  }

  double get topInset {
    return _queryData.padding.top;
  }

  double get width {
    return _queryData.size.shortestSide;
  }

  double get height {
    return _queryData.size.longestSide;
  }

  double setHeight(double percentage) {
    if (percentage == 0) {
      return 0;
    }
    return height * (percentage / 100);
  }

  double setWidth(double percentage) {
    if (percentage == 0) {
      return 0;
    }
    return width * (percentage / 100);
  }
}

class _TravaFontSizer {
  late num _scale;
  _TravaFontSizer(BuildContext context) {
    _scale = (MediaQuery.of(context).size.longestSide +
            MediaQuery.of(context).size.shortestSide) /
        4;
  }

  double sp(double? percentage) {
    return (_scale * ((percentage ?? 35.0) / (1000 - 50))).toDouble();
  }
}

class _TravaInsets {
  late _TravaDimension sizer;

  _TravaInsets(BuildContext context) {
    sizer = _TravaDimension(context);
  }

  EdgeInsets get zero {
    return EdgeInsets.zero;
  }

  EdgeInsets all(double inset) {
    return EdgeInsets.all(sizer.setWidth(inset));
  }

  EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      top: sizer.setHeight(top),
      left: sizer.setWidth(left),
      bottom: sizer.setHeight(bottom),
      right: sizer.setWidth(right),
    );
  }

  EdgeInsets fromLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) {
    return EdgeInsets.fromLTRB(
      sizer.setWidth(left),
      sizer.setHeight(top),
      sizer.setWidth(right),
      sizer.setHeight(bottom),
    );
  }

  EdgeInsets symmetric({
    double vertical = 0,
    double horizontal = 0,
  }) {
    return EdgeInsets.symmetric(
      vertical: sizer.setHeight(vertical),
      horizontal: sizer.setWidth(horizontal),
    );
  }
}

class TravaScaleUtil {
  final BuildContext context;

  TravaScaleUtil(this.context);

  _TravaDimension get sizer => _TravaDimension(context);
  _TravaFontSizer get fontSizer => _TravaFontSizer(context);
  _TravaInsets get insets => _TravaInsets(context);
}

Offset getPos(BuildContext context) {
  final RenderBox box = context.findRenderObject()! as RenderBox;
  return box.localToGlobal(Offset.zero);
}
