import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/request/availabale_packages.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/bottom_sheet/deliver_package_bottom_sheet.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/notification_button.dart';

import 'package:trava/screens/more_screen/components/more_list_tile.dart';
import 'package:trava/screens/more_screen/components/packages_to_pickup_screen.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/widgets/buttons/back_button.dart';

class PackagesAvailableForDeliveryScreen extends StatelessWidget {
  static const String routeName = "/packages-available-for-delivery-screen";
  const PackagesAvailableForDeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 27.h,
          ),
          child: ValueListenableBuilder<Future<AvailablePackages?>?>(
            valueListenable: model.availablePackages,
            builder: (context, data, ___) {
              return FutureBuilder<AvailablePackages?>(
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      snapshot.data == null) return const Apploader();
                  if (snapshot.hasError && snapshot.data == null) {
                    return TravaErrorState(
                      errorMessage: parseError(
                        snapshot.error,
                        "We could not fetch available packages",
                      ),
                      onRetry: () => model.updateAvailablePackages =
                          model.getAvailablePackages(),
                    );
                  }

                  return Column(
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
                                  "Are you sure you want to turn off your delivery request?",
                              onYesTap: () async {
                            Navigator.pop(context);

                            final doRoute = await formSubmitDialog(
                                context: context,
                                future: model.turnOffDeliveryRequest(),
                                prompt: "Turning off Delivery Request...");

                            if (doRoute != null) {
                              Navigator.pop(context);
                            }
                          });
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
                            itemCount: snapshot.data?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              Data package = snapshot.data!.data![index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/speaker.svg"),
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
                                                      color: const Color(
                                                          0xff171718),
                                                    ),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          "Package (${package.deliveryCode}) is going your way on ${TravaFormatter.formatDateShort(package.deliveryDate ?? DateTime.now().toString())}. It is to be picked up at ${package.pickupLocation} on ${TravaFormatter.formatDateShort(package.pickupTime ?? DateTime.now().toString())} and it’s to be delivered at ${package.deliveryHub} on ${TravaFormatter.formatDateShort(package.pickupTime ?? DateTime.now().toString())}. You’ll be paid ${TravaFormatter.formatCurrency(package.amount.toString())} after successful delivery.  "),
                                                  TextSpan(
                                                    text: "See Details",
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder: (context) =>
                                                                  DeliverPackageBottomSheet(
                                                                package,
                                                              ),
                                                            );
                                                          },
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4!
                                                        .copyWith(
                                                          color: const Color(
                                                              0xff171718),
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
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
                                                backgroundColor:
                                                    const Color(0xffF45050)
                                                        .withOpacity(0.1),
                                                textColor: TravaColors.red,
                                                onTap: () {
                                                  snapshot.data!.data!
                                                      .removeWhere((element) =>
                                                          element.sId ==
                                                          package.sId);

                                                  model.updateAvailablePackages =
                                                      Future.value(
                                                          snapshot.data!);
                                                },
                                                text: 'Ignore',
                                              ),
                                              SizedBox(width: 30.w),
                                              NotificationButton(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                textColor: Colors.white,
                                                onTap: () async {
                                                  final result =
                                                      await formSubmitDialog(
                                                    context: context,
                                                    future: model.acceptPackage(
                                                      package.sId!,
                                                    ),
                                                    prompt:
                                                        "Please wait while we accept your package...",
                                                  );

                                                  if (result != null) {
                                                    showNotificationBottomSheet(
                                                      context,
                                                      popContext: false,
                                                      onTap: () {
                                                        Navigator
                                                            .pushReplacementNamed(
                                                          context,
                                                          PackagesToPickUpScreen
                                                              .routeName,
                                                        );
                                                      },
                                                      title: "Success!",
                                                      message:
                                                          "You’ve successfully accepted to deliver Package (${package.deliveryCode}). Please don’t forget to pick it up at ${package.pickupLocation} on ${TravaFormatter.formatDateShort(package.pickupTime ?? DateTime.now().toString())} ",
                                                      gif:
                                                          "assets/images/congratulation_icon.gif",
                                                      buttonLabel: "Okay",
                                                    );
                                                  }
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
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
