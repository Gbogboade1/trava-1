import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trava/screens/history_screen/components/delivered_package_details_screen.dart';

class DeliveredTabView extends StatelessWidget {
  const DeliveredTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Scrollbar(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15.0.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/baggage.svg',
                      ),
                      SizedBox(width: 17.w),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: const Color(0xff171718),
                                    ),
                            children: [
                              const TextSpan(
                                  text:
                                      "You delivered package (154)  for Akinlabi Boluwatife  at DHL Hub, Asaba, Delta State. Package delivery code was 02345678. "),
                              TextSpan(
                                text: "See Details",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context,
                                        DeliveredPackageDetailsScreen.routeName,
                                        arguments: [1]);
                                  },
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: const Color(0xff171718),
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
