import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/models/https/users/otp_response.dart';
import 'package:trava/screens/forget_password_screen/new_password_screen.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/services/http/auth/auth_http_service.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:provider/provider.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_scaffold.dart';

import '../../widgets/buttons/back_button.dart';
import 'components/otp_field.dart';

class ResetCodeScreen extends HookWidget {
  static const String routeName = "/reset_code";

  final OtpResponse argument;
  ResetCodeScreen(this.argument, {Key? key}) : super(key: key);

  final AuthHttpService authHttpService = AuthHttpService();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    final animationController =
        useAnimationController(duration: const Duration(seconds: 30));
    final animation = useAnimation(
        Tween<double>(begin: 30, end: 0).animate(animationController));
    final pinController = useTextEditingController();
    final state = useState(false);
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
            "Please fill in the reset code you recieved in your mail below",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 32.h),
          Text(
            "Reset Code",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 8.h),
          OtpField(pinController, () {
            if (pinController.text.length == 5) {
              state.value = true;
            } else {
              state.value = false;
            }
          }),
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
                          ..onTap = () async {
                            if (!animationController.isAnimating ||
                                animationController.isCompleted) {
                              animationController.forward();
                            }
                            final doRoute = await formSubmitDialog(
                                context: context,
                                future: authHttpService.forgotPassword(
                                    model.emailController.text.trim()));
                          },
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: animationController.isAnimating
                                  ? Theme.of(context)
                                      .colorScheme
                                      .secondaryVariant
                                  : Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .color,
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
                Offstage(
                    offstage: animationController.isAnimating ? false : true,
                    child: Text(" in 00:${animation.toInt()}"))
              ],
            ),
          ),
          SizedBox(height: 56.h),
          DefaultButton(
            isActive: state.value,
            buttonLabel: "Submit",
            onTap: () {
              if (!state.value) {
                return;
              }
              log("text --- ${pinController.text}");
              if (pinController.text.trim() == argument.otp) {
                Navigator.pushNamed(
                  context,
                  NewPasswordScreen.routeName,
                  arguments: argument,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
