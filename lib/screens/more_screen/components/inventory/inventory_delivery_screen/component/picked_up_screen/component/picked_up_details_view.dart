import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/widgets/package_detail_field.dart';

class PickedUpDetailsView extends StatelessWidget {
  const PickedUpDetailsView({
    Key? key,
    required this.package,
  }) : super(key: key);
  final Data package;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: VerifyPickUpDetails(package)),
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
                image: DecorationImage(
                  image: NetworkImage(
                    package.images ??
                        'https://cholatrek-9acb7.appspot.com.storage.googleapis.com/87b4e5ed-72d1-482a-9aa3-084a4c7d5950.png',
                  ),
                  fit: BoxFit.cover,
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
                  title: "Package Delivery Code:",
                  value: "${package.pickupLocation}",
                ),
              ),
              Expanded(
                child: PackageDetailField(
                  title: "Package Delivery Time:",
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
