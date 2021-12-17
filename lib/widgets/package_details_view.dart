import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/models/https/request/sent_response.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/intl_formatter.dart';

class PackageDetailsView extends StatelessWidget {
  PackageDetailsView({
    Key? key,
    required this.package,
  }) : super(key: key);
  final Data package;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headline2,
              children: [
                TextSpan(text: "Package ${package.deliveryCode} Details "),
                TextSpan(
                  text:
                      "(${TravaFormatter.formatCurrency('${package.amount}')})",
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: TravaColors.red,
                      ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Expanded(
          child: PackageDetails(package),
        ),
      ],
    );
  }
}

class PackageDetails extends StatelessWidget {
  const PackageDetails(
    this.package, {
    Key? key,
  }) : super(key: key);

  final Data package;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 146.h,
            width: 241.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
              image: DecorationImage(
                image: NetworkImage(
                  package.images ??
                      'https://cholatrek-9acb7.appspot.com.storage.googleapis.com/87b4e5ed-72d1-482a-9aa3-084a4c7d5950.png',
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 32.h),
        Text(
          "Package Description",
          style: TextStyle(
            fontSize: 12.sp,
            color: TravaColors.gray3,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          "${package.description}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: PackageDetailField(
                title: "Package Type:",
                value: "${package.type} Weight",
              ),
            ),
            Expanded(
              child: PackageDetailField(
                title: "Package Quantity:",
                value: "${package.quantity}",
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: PackageDetailField(
                title: "Package Destination:",
                value: "${package.destTown}, ${package.destState} State",
              ),
            ),
            Expanded(
              child: PackageDetailField(
                title: "Package Delivery Date:",
                value: TravaFormatter.formatDate(
                    package.deliveryDate ?? DateTime.now().toString()),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: PackageDetailField(
                title: "Preferred Mode of Transport:",
                value: "${package.deliveryMode}",
              ),
            ),
            Expanded(
              child: PackageDetailField(
                title: "Preferred Delivery Hub:",
                value: "${package.deliveryHub}",
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: PackageDetailField(
                title: "Pickup Loation:",
                value: "${package.pickupLocation}",
              ),
            ),
            Expanded(
              child: PackageDetailField(
                title: "Pickup Time:",
                value: TravaFormatter.formatTime("${package.pickupTime}"),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: PackageDetailField(
                  title: "Sender’s Name:",
                  value:
                      "${package.sender?.firstName} ${package.sender?.lastName}"),
            ),
            Expanded(
              child: PackageDetailField(
                title: "Sender’s Phone Number:",
                value: "${package.sender?.phone}",
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PackageDetailField extends StatelessWidget {
  const PackageDetailField({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: TravaColors.gray3,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
