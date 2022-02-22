import 'dart:math';
import 'dart:developer' as d;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/src/provider.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/users/notifications.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/notification_tile.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/widgets/buttons/back_button.dart';

enum NotificationType {
  funded,
  paid,
  goingYourWay,
  deliver,
  readyToPickup,
  pickedUp,
  delivered,
  timeToPickup,
}

class NotificationsScreen extends StatelessWidget {
  static const routeName = '/notifications';
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return Scaffold(
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
                  Text("Notifications",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 24.h),
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
                child: ValueListenableBuilder<Future<Notifications?>?>(
                    valueListenable: model.notifications,
                    builder: (context, data, ___) {
                      return FutureBuilder<Notifications?>(
                          future: data,
                          builder: (context, task) {
                            if (task.connectionState ==
                                    ConnectionState.waiting &&
                                task.data == null) return const Apploader();
                            if (task.hasError && task.data == null) {
                              return TravaErrorState(
                                errorMessage: parseError(
                                  task.error,
                                  "We could not fetch notifications",
                                ),
                                onRetry: () {},
                              );
                            }
                            d.log("tyu --${task.data!.toJson()}");
                            return ListView.builder(
                              itemCount: task.data?.user?.length,
                              itemBuilder: (context, index) {
                                NotificationType notificationType =
                                    task.data!.user![index].category == "debit"
                                        ? NotificationType.paid
                                        : task.data!.user![index].category ==
                                                "credit"
                                            ? NotificationType.funded
                                            : NotificationType.readyToPickup;
                                switch (notificationType) {
                                  case NotificationType.funded:
                                    return FundedNotificationTile(
                                        task.data!.user![index].description!);
                                  case NotificationType.paid:
                                    return PaidNotificationTile(
                                        task.data!.user![index].description!);

                                  case NotificationType.readyToPickup:
                                    return ReadyToPickUpNotificationTile(
                                        task.data!.user![index].description!);
                                  default:
                                    return FundedNotificationTile(
                                        task.data!.user![index].description!);
                                }

                                //  return const PaidNotificationTile();
                              },
                            );
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
