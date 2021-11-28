import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/forget_password_screen/reset_code_screen.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_scaffold.dart';

import '../../widgets/buttons/back_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "/forget_password";
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "e.g bolu@gmail.com",
                ),
              ),
              SizedBox(height: 56.h),
              DefaultButton(
                isActive: true,
                buttonLabel: "Send reset code",
                onTap: () {
                  //TODO: Send reset code
                  Navigator.pushNamed(context, ResetCodeScreen.routeName);
                },
              )
            ],
          ),
    );
  }
}

