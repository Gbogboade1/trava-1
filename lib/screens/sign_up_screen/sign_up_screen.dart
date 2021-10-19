import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/login_screen/login_screen.dart';
import 'package:trava/utilities/constants.dart';
import 'package:trava/widgets/buttons/default_button.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "/signup_screen";
  const SignUpScreen({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Fill in the details below to own a Trava account",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 16.h),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Firstname",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
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
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "e.g Akinlabi",
                      ),
                    ),
                    SizedBox(height: 16.h),
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
                    SizedBox(height: 16.h),
                    Text(
                      "Phone Number",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "e.g 09034897654",
                      ),
                    ),
                    SizedBox(height: 40.h),
                    DefaultButton(
                        buttonLabel: "Sign Up",
                        onTap: () {
                          //TODO: Implement sign up
                        }),
                    SizedBox(height: 32.h),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(text: "Already have an account? "),
                            TextSpan(
                              text: "Log In",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .pushNamed(LoginScreen.routeName);
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xff646465),),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                                text:
                                    "By Tapping Sign up and using Trava, you agree\n to our "),
                            TextSpan(
                                text: "Terms ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      fontSize: 12.sp,
                                    )),
                            const TextSpan(text: "and"),
                            TextSpan(
                                text: " Privacy Policy.",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      fontSize: 12.sp,
                                    )),
                          ],
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
