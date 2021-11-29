import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/models/https/users/sign_up.dart';
import 'package:trava/screens/login_screen/login_screen.dart';
import 'package:trava/services/http/auth/auth_http_service.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/validators.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_scaffold.dart';

import '../../navigation.dart';

class SignUpScreen extends HookWidget {
  static const String routeName = "/signup_screen";

  final AuthHttpService authHttpService = AuthHttpService();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final pwdController = useTextEditingController();

    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final phoneNumberCobtroller = useTextEditingController();
    return CustomScaffold(
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
                SizedBox(height: 16.h),
                Text(
                  "Password",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: pwdController,
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
                  "Phone Number",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: phoneNumberCobtroller,
                  validator: TravaValidators.phoneValidator,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "e.g 09034897654",
                  ),
                ),
                SizedBox(height: 40.h),
                DefaultButton(
                  isActive: true,
                  buttonLabel: "Sign Up",
                  onTap: () async {
                    final doRoute = await formSubmitDialog(
                      context: context,
                      future: authHttpService.signUp(SignUpRequest(
                        email: emailController.text.trim(),
                        password: pwdController.text,
                        firstName: firstNameController.text.trim(),
                        lastName: lastNameController.text.trim(),
                        phone: phoneNumberCobtroller.text,
                      )),
                      prompt: "please wait while we sign up.",
                    );

                    // if doROute not null and doRoute.status is true then route to navigation screen
                    if (doRoute != null && (doRoute.status ?? false)) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Navigation.routeName,
                        (route) => false,
                      );
                    }
                  },
                ),
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
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      fontSize: 12.sp,
                                    )),
                        const TextSpan(text: "and"),
                        TextSpan(
                            text: " Privacy Policy.",
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
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
    );
  }
}
