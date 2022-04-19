import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/forget_password_screen/reset_code_screen.dart';
import 'package:trava/services/http/auth/auth_http_service.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:provider/provider.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_scaffold.dart';

import '../../widgets/buttons/back_button.dart';

class ForgetPasswordScreen extends HookWidget {
  static const String routeName = "/forget_password";

  final AuthHttpService authHttpService = AuthHttpService();

  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();

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
            "Please fill in the email address registered to your Trava account below to get a reset code",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 32.h),
          Text(
            "Email Address",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            controller: model.emailController,
            decoration: kTextFieldDecoration.copyWith(
              hintText: "e.g bolu@gmail.com",
            ),
          ),
          SizedBox(height: 56.h),
          DefaultButton(
            isActive: true,
            buttonLabel: "Send reset code",
            onTap: () async {
              final doRoute = await formSubmitDialog(
                  context: context,
                  future: authHttpService
                      .forgotPassword(model.emailController.text.trim()));

              if (doRoute != null && (doRoute.status ?? false)) {
                Navigator.pushNamed(
                  context,
                  ResetCodeScreen.routeName,
                  arguments: doRoute,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
