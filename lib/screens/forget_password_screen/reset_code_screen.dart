import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/widgets/buttons/default_button.dart';

import 'components/back_button.dart';
import 'components/otp_field.dart';

class ResetCodeScreen extends StatelessWidget {
  static const String routeName = "/reset_code";
  const ResetCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: const Duration(seconds: 30));
    final animation = useAnimation(
        Tween<double>(begin: 30, end: 0).animate(animationController));
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
                "Please fill in the reset code you recieved in your mail below",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 32.h),
              Text(
                "Reset Code",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 8.h),
              OtpField(),
              SizedBox(height: 40.h),
              Center(
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(text: "Didn’t get a code? "),
                          TextSpan(
                            text: "Resend code",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //TODO: Implement resend code
                                animationController.forward();
                              },
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      fontSize: 12.sp,
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ],
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff646465),
                            ),
                      ),
                    ),
                    Text("in 00:${animation.toInt()}")
                  ],
                ),
              ),
              SizedBox(height: 56.h),
              DefaultButton(
                isActive: false,
                buttonLabel: "Submit",
                onTap: () {
                  //TODO: implement otp check.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
