import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trava/components/fragments/spacers/app_sized_box.dart';
import 'package:trava/components/fragments/spacers/text_styles.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/extensions.dart';

class AvatarBottomSheet extends StatelessWidget {
  const AvatarBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizer = context.scaler.sizer;
    final insets = context.scaler.insets;

    return Material(
      color: TravaColors.transparent,
      child: Container(
        constraints: BoxConstraints.tightFor(
          width: sizer.width,
          height: sizer.setHeight(20),
        ),
        decoration: const BoxDecoration(
          color: TravaColors.white,
        ),
        padding: insets.symmetric(
          vertical: 2,
          horizontal: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Select Image Source",
              style: TravaTextStyle.medium,
            ),
            const TravaSizedBox(height: 2),
            Expanded(
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(4),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(5),
                },
                children: [
                  TableRow(
                    children: [
                      TableRowInkWell(
                        child: const TravaSizedBox(
                          height: 8,
                          width: 8,
                          child: FittedBox(
                            child: Icon(Icons.photo_library_outlined),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                      TableRowInkWell(
                        child: const TravaSizedBox(
                          height: 8,
                          width: 8,
                          child: FittedBox(
                            child: Icon(Icons.camera),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      const Offstage(),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableRowInkWell(
                        child: const Text(
                          "Gallery",
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                      TableRowInkWell(
                        child: const Text(
                          "Camera",
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      const Offstage(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
