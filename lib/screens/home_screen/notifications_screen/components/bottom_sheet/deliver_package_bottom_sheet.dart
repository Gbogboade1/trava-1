import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trava/models/enums/is_bloody.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/notification_button.dart';
import 'package:trava/screens/more_screen/components/packages_to_pickup_screen.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/widgets/package_details_view.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/state/profile/auth_state.dart';

class DeliverPackageBottomSheet extends StatelessWidget {
  const DeliverPackageBottomSheet(
    this.package, {
    Key? key,
  }) : super(key: key);

  final Data package;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return SingleChildScrollView(
      child: SizedBox(
        height: 718.h,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(10.w),
                //width: 32.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  size: 20.h,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(24.w, 15.h, 24.w, 25.h),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: PackageDetailsView(
                      package: package,
                      bloody: isBloody.yellow,
                    )),
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        NotificationButton(
                          backgroundColor:
                              const Color(0xffF45050).withOpacity(0.1),
                          textColor: TravaColors.red,
                          onTap: () {
                            model.availablePackages.value!.then((value) {
                              value!.data!.removeWhere(
                                  (element) => element.sId == package.sId);

                              model.updateAvailablePackages =
                                  Future.value(value);
                            });
                          },
                          text: 'Ignore',
                        ),
                        SizedBox(width: 30.w),
                        NotificationButton(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          textColor: Colors.white,
                          onTap: () {
                            Navigator.pop(context);

                            final result = formSubmitDialog(
                              context: context,
                              future: model.acceptPackage(package.sId!),
                              prompt:
                                  "Please wait while we accept your package...",
                            );

                            if (result != null) {
                              showNotificationBottomSheet(
                                context,
                                popContext: false,
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    PackagesToPickUpScreen.routeName,
                                  );
                                },
                                title: "Success!",
                                message:
                                    "You’ve successfully accepted to deliver Package (${package.deliveryCode}). Please don’t forget to pick it up at ${package.pickupLocation} on ${TravaFormatter.formatDateShort(package.pickupTime ?? DateTime.now().toString())} ",
                                gif: "assets/images/congratulation_icon.gif",
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
            ),
          ],
        ),
      ),
    );
  }
}
