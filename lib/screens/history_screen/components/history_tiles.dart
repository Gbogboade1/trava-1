
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum PackageDeliveryStatus {
  delivered,
  inTransit,
  pickedUpByDeliverer,
  pickedUpAtLocation
}

class SentHistoryTile extends StatelessWidget {
  const SentHistoryTile({
    Key? key,
    required this.packageDeliveryStatus,
  }) : super(key: key);

  final PackageDeliveryStatus packageDeliveryStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0.h),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/images/baggage.svg',
            ),
            SizedBox(width: 17.w),
            Flexible(
              child:
                  Column(mainAxisSize: MainAxisSize.min, children: [
                RichText(
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
                              "Your package (154)  to be delivered at DHL Hub, Asaba, Delta State by Aladetimi Tolulope. "),
                      TextSpan(
                        text: "See Details",
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
                SizedBox(height: 8.h),
                Row(children: [
                  Icon(
                    Icons.shield,
                    color: () {
                      switch (packageDeliveryStatus) {
                        case PackageDeliveryStatus.delivered:
                          return const Color(0xff1A1AF2);
                        case PackageDeliveryStatus.inTransit:
                          return const Color(0xffCFAE00);
                        case PackageDeliveryStatus
                            .pickedUpByDeliverer:
                          return const Color(0xff000000);
                        case PackageDeliveryStatus.pickedUpAtLocation:
                          return const Color(0xff06B248);
                      }
                    }(),
                    size: 12.w,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    () {
                      switch (packageDeliveryStatus) {
                        case PackageDeliveryStatus.delivered:
                          return "Package delivered at the delivery location";
                        case PackageDeliveryStatus.inTransit:
                          return "Package in transit to delivery location";
                        case PackageDeliveryStatus
                            .pickedUpByDeliverer:
                          return "Package picked up by Aladetimi Tolulope";
                        case PackageDeliveryStatus.pickedUpAtLocation:
                          return "Package has been picked up at the delivery location";
                      }
                    }(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: () {
                      switch (packageDeliveryStatus) {
                        case PackageDeliveryStatus.delivered:
                          return const Color(0xff1A1AF2);
                        case PackageDeliveryStatus.inTransit:
                          return const Color(0xffCFAE00);
                        case PackageDeliveryStatus
                            .pickedUpByDeliverer:
                          return const Color(0xff000000);
                        case PackageDeliveryStatus.pickedUpAtLocation:
                          return const Color(0xff06B248);
                      }
                    }(),
                    ),
                  )
                ])
              ]),
            )
          ]),
    );
  }
}