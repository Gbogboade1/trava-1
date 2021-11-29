import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trava/components/fragments/spacers/app_sized_box.dart';
import 'package:trava/utils/dimensions.dart';
import 'package:trava/utils/typedefs.dart';
import 'package:trava/widgets/buttons/default_button.dart';

class TravaEmptyState extends StatelessWidget {
  final String message;
  final String? subMessage;
  final OnPressed? onRetry;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const TravaEmptyState({Key? key, 
    required this.message,
    this.onRetry,
    this.subMessage,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scaler = TravaScaleUtil(context);
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Icon(
          Icons.workspaces_outline,
          size: scaler.fontSizer.sp(200),
        ),
        const TravaSizedBox(height: .5),
        Flexible(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight:
                  subMessage != null ? FontWeight.bold : FontWeight.w300,
            ),
          ),
        ),
        if (subMessage != null) const TravaSizedBox(height: .5),
        if (subMessage != null)
          Flexible(
            child: Text(
              subMessage!,
              textAlign: TextAlign.center,
              // style: TravaTextStyle.light,
            ),
          ),
        if (onRetry != null)
          Flexible(
            child: FittedBox(
              child: DefaultButton(
                isActive: true,
                buttonLabel: "Refresh",
                // textColor: TravaColors.purple,
                // color: TravaColors.transparent,
                onTap: onRetry,
              ),
            ),
          ),
      ],
    );
  }
}
