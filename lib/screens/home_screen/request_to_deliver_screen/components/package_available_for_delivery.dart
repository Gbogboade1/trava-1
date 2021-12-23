import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/bottom_sheet/deliver_package_bottom_sheet.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/notification_button.dart';

import 'package:trava/screens/more_screen/components/more_list_tile.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/widgets/buttons/back_button.dart';

class PackagesAvailableForDeliveryScreen extends StatelessWidget {
  static const String routeName = "/packages-available-for-delivery-screen";
  const PackagesAvailableForDeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 27.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  const Spacer(),
                  Text("Packages Available for Delivery",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 16.h),
              MoreListTile(
                title: "Turn off Delivery Request",
                onTap: () {
                  showAreYouSureBottomSheet(context,
                      description:
                          "Are you sure you want to turn off your delivery request?");
                },
              ),
              SizedBox(height: 16.h),
              Text(
                TravaFormatter.formatDate('${DateTime.now()}'),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/images/speaker.svg"),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: RichText(
                                      text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              color: const Color(0xff171718),
                                            ),
                                        children: [
                                          const TextSpan(
                                              text:
                                                  "Package (154) is going your way on 28-03-2021. It is to be picked up at DHL Hub, Akure, Ondo State within the hours of 9am-6pm on 27-03-2021 and it’s to be delivered at DHL Hub, Asaba, Delta State on 28-03-2021. You’ll be paid ₦1,570 after successful delivery.  "),
                                          TextSpan(
                                            text: "See Details",
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) =>
                                                      const DeliverPackageBottomSheet(),
                                                );
                                              },
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  color:
                                                      const Color(0xff171718),
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  Row(
                                    children: [
                                      NotificationButton(
                                        backgroundColor: const Color(0xffF45050)
                                            .withOpacity(0.1),
                                        textColor: TravaColors.red,
                                        onTap: () {},
                                        text: 'Ignore',
                                      ),
                                      SizedBox(width: 30.w),
                                      NotificationButton(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        textColor: Colors.white,
                                        onTap: () {
                                          showNotificationBottomSheet(context,
                                              popContext: false,
                                              title: "Success!",
                                              message:
                                                  "You’ve successfully accepted to deliver Package (234). Please don’t forget to pick it up at DHL Hub, Akure, Ondo State within the hours of 9am-6pm on 27-03-2021 ",
                                              gif:
                                                  "assets/images/congratulation_icon.gif",
                                              buttonLabel: "Okay");
                                        },
                                        text: "I’ll deliver package",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
