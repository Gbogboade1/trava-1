import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/validators.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_bottom_sheet.dart';

class ChangePasswordBottomSheet extends HookWidget {
  const ChangePasswordBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final oldPwdController = useTextEditingController();
    final newPwdController = useTextEditingController();
    return CustomBottomSheet(
      title: "Password Settings",
      height: 439.h,
      content: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Old Password",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 8.h),
            TextFormField(
              controller: oldPwdController,
              validator: TravaValidators.passwordValidator,
              decoration: kTextFieldDecoration.copyWith(
                hintText: "Your password",
                suffixIcon: Icon(
                  Icons.visibility_outlined,
                  color: const Color(0xffBDBDBD),
                  size: 20.h,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "New Password",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 8.h),
            TextFormField(
              controller: newPwdController,
              validator: TravaValidators.passwordValidator,
              decoration: kTextFieldDecoration.copyWith(
                hintText: "Your password",
                suffixIcon: Icon(
                  Icons.visibility_outlined,
                  color: const Color(0xffBDBDBD),
                  size: 20.h,
                ),
              ),
            ),
            SizedBox(height: 40.h),
            DefaultButton(
              isActive: true,
              buttonLabel: "Change password",
              onTap: () {
                //TODO: Change password
              },
            ),
          ],
        ),
      ),
    );
  }
}
