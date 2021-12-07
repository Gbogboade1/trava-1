import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/notification_button.dart';
import 'package:trava/widgets/package_details_view.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/widgets/buttons/default_button.dart';

class DeliverPackageBottomSheet extends StatelessWidget {
  const DeliverPackageBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const PackageDetailsView(packageList: [1]),
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        NotificationButton(
                          backgroundColor:
                              const Color(0xffF45050).withOpacity(0.1),
                          textColor: TravaColors.red,
                          onTap: () {},
                          text: 'Ignore',
                        ),
                        SizedBox(width: 30.w),
                        NotificationButton(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          textColor: Colors.white,
                          onTap: () {
                            Navigator.pop(context);

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding: const EdgeInsets.all(0),
                                  insetPadding: const EdgeInsets.all(5),
                                  content: SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          24.w, 29.h, 24.w, 27.h),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 120.h,
                                            width: 120.w,
                                          ),
                                          SizedBox(
                                            height: 24.h,
                                          ),
                                          Text(
                                            "Success!",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                          ),
                                          SizedBox(
                                            height: 9.h,
                                          ),
                                          Text(
                                            "You’ve successfully accepted to deliver Package (234). You’ll be notified at intervals before pickup time. You can also check the More Tab to keep track of items you need to pickup.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  color: TravaColors.black,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 40.h,
                                          ),
                                          DefaultButton(
                                            isActive: true,
                                            buttonLabel: "Thank You",
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
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
