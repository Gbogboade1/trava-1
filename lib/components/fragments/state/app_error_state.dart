import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trava/utils/extensions.dart';
import 'package:trava/components/fragments/spacers/app_sized_box.dart';
import 'package:trava/utils/typedefs.dart';
import 'package:trava/widgets/buttons/default_button.dart';

class TravaErrorState extends StatelessWidget {
  final String errorMessage;
  final OnPressed onRetry;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const TravaErrorState({Key? key, 
    required this.errorMessage,
    required this.onRetry,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TravaSizedBox(
      height: 15.0,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          SvgPicture.asset(
           "",
            height: context.scaler.sizer.setHeight(6),
          ),
          const TravaSizedBox(height: .5),
          Flexible(
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(
            child: FittedBox(
              child: DefaultButton(
                buttonLabel: "Retry",
                isActive:true,
                // textColor: TravaColors.red,
                onTap: onRetry,
                // color: TravaColors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
