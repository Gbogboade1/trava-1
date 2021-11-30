import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/models/https/users/otp_response.dart';
import 'package:trava/models/https/users/reset_request.dart';
import 'package:trava/navigation.dart';
import 'package:trava/screens/login_screen/login_screen.dart';
import 'package:trava/services/http/auth/auth_http_service.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_scaffold.dart';

import '../../widgets/buttons/back_button.dart';

class NewPasswordScreen extends HookWidget {
  static const String routeName = "/new_password";
  final OtpResponse otpResponse;
  NewPasswordScreen(this.otpResponse);
  AuthHttpService authHttpService = AuthHttpService();

  @override
  Widget build(BuildContext context) {
    final _passwordController = useTextEditingController();
    return CustomScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton(),
          SizedBox(height: 16.h),
          Text(
            "Forgot Password?",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 8.h),
          Text(
            "Don’t fret. We’ve got you covered",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 32.h),
          Text(
            "New Password",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            controller: _passwordController,
            decoration: kTextFieldDecoration.copyWith(
              hintText: "Your new password",
              suffixIcon: Icon(
                Icons.visibility_outlined,
                color: const Color(0xffBDBDBD),
                size: 20.h,
              ),
            ),
          ),
          SizedBox(height: 56.h),
          DefaultButton(
            isActive: true,
            buttonLabel: "Submit and Log me in",
            onTap: () async {
              final doRoute = await formSubmitDialog(
                context: context,
                future: authHttpService.newPassword(
                  ResetRequest(
                    newPassword: _passwordController.text,
                    otp: otpResponse.otp,
                  ),
                ),
              );

              if (doRoute != null && (doRoute.status ?? false)) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName,
                  (Route<dynamic> route) => false,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
