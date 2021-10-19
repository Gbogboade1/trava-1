import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/utilities/constants.dart';
import 'package:trava/widgets/buttons/default_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "/forget_password";
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 27.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(),
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
                buttonLabel: "Send reset code",
                onTap: () {
                  //TODO: Send resend code
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.all(10.42.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.secondaryVariant,
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 20.h,
        ),
      ),
    );
  }
}
