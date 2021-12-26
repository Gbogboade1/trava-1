import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/widgets/package_detail_field.dart';

class PickedUpDetailsView extends StatelessWidget {
  const PickedUpDetailsView({
    Key? key,
    required this.packageList,
  }) : super(key: key);
  final List packageList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: VerifyPickUpDetails()),
      ],
    );
  }
}

class VerifyPickUpDetails extends StatelessWidget {
  const VerifyPickUpDetails({
    Key? key,
  }) : super(key: key);

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
            "Two boxes of sophisticated wine. A box contain 8 bottles.",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 16.h),
          Row(
            children: const [
              Expanded(
                child: PackageDetailField(
                  title: "Package Type:",
                  value: "Normal Weight",
                ),
              ),
              Expanded(
                child: PackageDetailField(
                  title: "Package Quantity:",
                  value: "2",
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: const [
              Expanded(
                child: PackageDetailField(
                  title: "Package Destination:",
                  value: "Ilesha, Osun State",
                ),
              ),
              Expanded(
                child: PackageDetailField(
                  title: "Package Delivery Date:",
                  value: "23-12-2021",
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: const [
              Expanded(
                child: PackageDetailField(
                  title: "Preferred Mode of Transport:",
                  value: "Private Car",
                ),
              ),
              Expanded(
                child: PackageDetailField(
                  title: "Preferred Delivery Hub:",
                  value: "DHL Hub, Asaba, Delta State.",
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: const [
              Expanded(
                child: PackageDetailField(
                  title: "Package Delivery Code:",
                  value: "23985634",
                ),
              ),
              Expanded(
                child: PackageDetailField(
                  title: "Package Delivery Time:",
                  value: "4:45pm",
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: const [
              Expanded(
                child: PackageDetailField(
                  title: "Deliever’s Name:",
                  value: "Boluwatife Akinlabi",
                ),
              ),
              Expanded(
                child: PackageDetailField(
                  title: "Deliverer’s Phone Number:",
                  value: "08136279876",
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: const [
              Expanded(
                child: PackageDetailField(
                  title: "Sender’s Name:",
                  value: "Boluwatife Akinlabi",
                ),
              ),
              Expanded(
                child: PackageDetailField(
                  title: "Sender’s Phone Number:",
                  value: "08136279876",
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
