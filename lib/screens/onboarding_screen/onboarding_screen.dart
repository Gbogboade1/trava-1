import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/login_screen/login_screen.dart';
import 'package:trava/screens/sign_up_screen/sign_up_screen.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/buttons/outlined_button.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  Widget backgroundImage = Image.asset(
    'assets/images/send_package.png',
    key: const ValueKey<int>(0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                child: child,
                scale: animation,
              );
            },
            child: backgroundImage,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.fromLTRB(23.5.w, 24.h, 23.5.w, 37.h),
              height: 425.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: TravaColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: 3,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                          backgroundImage = index == 0
                              ? Image.asset(
                                  'assets/images/send_package.png',
                                  key: const ValueKey<int>(0),
                                )
                              : index == 1
                                  ? Image.asset(
                                      'assets/images/earn.png',
                                      key: const ValueKey<int>(1),
                                    )
                                  : Image.asset(
                                      'assets/images/drop_off.png',
                                      key: const ValueKey<int>(2),
                                    );
                        });
                      },
                      itemBuilder: (context, index) => Column(
                        children: [
                          Text(() {
                            switch (index) {
                              case 0:
                                return "Send packages at a cheaper cost anytime, anywhere.";
                              case 1:
                                return 'Earn as you travel.';
                              case 2:
                                return 'Drop off and pickup hub at your disposal.';
                              default:
                                return '';
                            }
                          }(),
                              style: Theme.of(context).textTheme.headline1,
                              textAlign: TextAlign.center),
                          SizedBox(height: 24.h),
                          Text(
                            () {
                              switch (index) {
                                case 0:
                                  return "Send packages to anyone in any city and state within 24 hours and half the cost of shipping through logistic companies.";
                                case 1:
                                  return 'Pick up packages to deliver at your traveling destination and earn while at it.';
                                case 2:
                                  return 'With Trava, Drop off and pick up made easier and secured.';
                                default:
                                  return '';
                              }
                            }(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: TravaColors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(3, (index) => buildDot(index: index)),
                  ),
                  SizedBox(height: 32.h),
                  DefaultButton(
                    isActive: true,
                    buttonLabel: "Sign Up",
                    onTap: () {
                      Navigator.of(context).pushNamed(SignUpScreen.routeName);
                    },
                  ),
                  SizedBox(height: 24.h),
                  TravaOutlinedButton(
                    buttonLabel: "Log In",
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 4.w),
      height: currentPage == index ? 10.w : 8.w,
      width: currentPage == index ? 10.w : 8.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == index
            ? TravaColors.blue
            : const Color(0xffC4C4C4).withOpacity(0.5),
      ),
    );
  }
}
