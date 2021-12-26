import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/hooks/profile_data_listening_widget.dart';
import 'package:trava/models/https/users/profile_update_request.dart';
import 'package:trava/services/http/auth/auth_http_service.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/validators.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_bottom_sheet.dart';

class EditProfileBottomSheet extends HookWidget {
  EditProfileBottomSheet({
    Key? key,
  }) : super(key: key);

  final AuthHttpService _services = AuthHttpService();
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    final emailController = useTextEditingController();
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    return ProfileSetUpDataListeningWidget(builder: (
      context,
      data,
    ) {
      emailController.text = data?.user?.email ?? '';
      firstNameController.text = data?.user?.firstName ?? '';
      lastNameController.text = data?.user?.lastName ?? '';
      phoneNumberController.text = data?.user?.phone ?? '';
      return CustomBottomSheet(
        title: "Edit Profile",
        content: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Firstname",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: firstNameController,
                validator: TravaValidators.required,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "e.g Hendrick",
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Lastname",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: lastNameController,
                validator: TravaValidators.required,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "e.g Akinlabi",
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Phone Number",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: phoneNumberController,
                validator: TravaValidators.phoneValidator,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "e.g 09034897654",
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Email Address",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: emailController,
                validator: TravaValidators.emailValidator,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "e.g bolu@gmail.com",
                ),
              ),
              SizedBox(height: 40.h),
              DefaultButton(
                isActive: true,
                buttonLabel: "Update profile",
                onTap: () async {
                  if (_key.currentState!.validate()) {
                    final changePassword = await formSubmitDialog(
                      context: context,
                      future: _services.profileUpdate(
                        ProfileUpdateRequest(
                          email: emailController.text.isEmpty
                              ? null
                              : emailController.text,
                          phone: phoneNumberController.text.isEmpty
                              ? null
                              : phoneNumberController.text,
                          firstName: firstNameController.text.isEmpty
                              ? null
                              : firstNameController.text,
                          lastName: lastNameController.text.isEmpty
                              ? null
                              : lastNameController.text,
                        ),
                      ),
                      prompt: "Kindly wait while we update your profile",
                    );
                    if (changePassword != null) {
                      model.status.value = Future.value(changePassword);
                      showNotificationBottomSheet(context,
                          title: "Profile updated!");
                    }
                  } else {
                    log('what\'s good my nigga??');
                  }
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
