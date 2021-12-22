
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/widgets/buttons/default_button.dart';

class VerifyForDropOff extends HookWidget {
  const VerifyForDropOff({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final codeController = useTextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Package Number",
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: codeController,
          keyboardType: TextInputType.number,
          decoration: kTextFieldDecoration.copyWith(
            hintText: "",
          ),
        ),
        SizedBox(height: 40.h),
        DefaultButton(
          isActive: true,
          buttonLabel: "Verify",
          onTap: () {
            showNotificationBottomSheet(context,
                title: "Package Verified for Drop-off!");
          },
        )
      ],
    );
  }
}
