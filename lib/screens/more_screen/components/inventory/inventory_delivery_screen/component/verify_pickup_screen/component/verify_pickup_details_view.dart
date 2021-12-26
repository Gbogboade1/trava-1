import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/widgets/package_detail_field.dart';

class VerifyPickUpDetailsView extends StatelessWidget {
  const VerifyPickUpDetailsView(
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
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headline2,
              children: [
                TextSpan(text: "Package ${package.deliveryCode} Details "),
                TextSpan(
                  text:
                      "(${TravaFormatter.formatCurrency(package.amount.toString())})",
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
          child: VerifyPickUpDetails(package),
        ),
      ],
    );
  }
}

class VerifyPickUpDetails extends StatelessWidget {
  const VerifyPickUpDetails(
    this.package, {
    Key? key,
  }) : super(key: key);
  final Data package;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 146.h,
              width: 241.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
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
                  title: "Package Delivery Code:",
                  value: "${package.deliveryCode}",
                ),
              ),
              Expanded(
                child: PackageDetailField(
                  title: "Package Delivery Time:",
                  value: TravaFormatter.formatTime(package.deliveryDate!),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: PackageDetailField(
                  title: "Deliever’s Name:",
                  value:
                      "${package.deliverer?.firstName} ${package.deliverer?.lastName}",
                ),
              ),
              Expanded(
                child: PackageDetailField(
                  title: "Deliverer’s Phone Number:",
                  value: "${package.deliverer?.phone}",
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
                      "${package.sender?.firstName} ${package.sender?.lastName}",
                ),
              ),
              Expanded(
                child: PackageDetailField(
                  title: "Sender’s Phone Number:",
                  value: "${package.sender?.phone}",
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
