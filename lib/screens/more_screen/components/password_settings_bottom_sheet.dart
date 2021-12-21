import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/models/https/users/update_password_request.dart';
import 'package:trava/services/http/auth/auth_http_service.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/validators.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_bottom_sheet.dart';

class PasswordSettingBottomSheet extends HookWidget {
  PasswordSettingBottomSheet({
    Key? key,
  }) : super(key: key);
  final AuthHttpService _services = AuthHttpService();
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final newController = useTextEditingController();
    final oldController = useTextEditingController();
    return CustomBottomSheet(
      title: "Password settings",
      content: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Old Password",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: oldController,
                validator: TravaValidators.required,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "e.g Hendrick",
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "New Password",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: newController,
                validator: TravaValidators.required,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "e.g Akinlabi",
                ),
              ),
              SizedBox(height: 40.h),
              DefaultButton(
                isActive: true,
                buttonLabel: "Change password",
                onTap: () async {
                  if (_key.currentState!.validate()) {
                    final changePassword = await formSubmitDialog(
                      context: context,
                      future: _services.updatePassword(
                        UpdatePasswordRequest(
                          newPassword: newController.text,
                          oldPassword: oldController.text,
                        ),
                      ),
                      prompt: "Kindly wait while we change password",
                    );
                    if (changePassword != null) {
                      showNotificationBottomSheet(context,
                          title: "Password Changed!");
                    }
                  } else {
                    log('what\'s good my nigga??');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
