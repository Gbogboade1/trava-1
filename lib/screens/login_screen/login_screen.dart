import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/forget_password_screen/forget_password_screen.dart';
import 'package:trava/screens/sign_up_screen/sign_up_screen.dart';
import 'package:trava/utilities/constants.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_scaffold.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login_screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
     
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Log In",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Fill in the details below to log into your Trava account",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 40.h),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    SizedBox(height: 16.h),
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Your password",
                        suffixIcon: Icon(
                          Icons.visibility_outlined,
                          color: const Color(0xffBDBDBD),
                          size: 20.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(text: "Forgot Password? "),
                            TextSpan(
                              text: "Tap here",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushNamed(
                                      ForgetPasswordScreen.routeName);
                                },
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    fontSize: 12.sp,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ],
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xff646465),
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(height: 56.h),
                    DefaultButton(
                        isActive: true,
                        buttonLabel: "Log In",
                        onTap: () {
                          //TODO: Implement login
                        }),
                    SizedBox(height: 48.h),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(text: "Don’t have an account? "),
                            TextSpan(
                              text: "Sign Up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .pushNamed(SignUpScreen.routeName);
                                },
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    fontSize: 12.sp,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ],
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xff646465),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      
    );
  }
}
