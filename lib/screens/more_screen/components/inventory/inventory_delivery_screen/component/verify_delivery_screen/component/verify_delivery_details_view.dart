import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/widgets/package_detail_field.dart';

class VerifyDeliveryDetailsView extends StatelessWidget {
  const VerifyDeliveryDetailsView({
    Key? key,
    required this.packageList,
  }) : super(key: key);
  final List packageList;

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
                const TextSpan(text: "Package 023 Details "),
                TextSpan(
                  text: "(₦1,570)",
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
          child: packageList.length <= 1
              ? const VerifyDeliveryDetails()
              : ListView.builder(
                  itemCount: packageList.length,
                  itemBuilder: (context, index) {
                    String packageRank = () {
                      switch (index) {
                        case 0:
                          return "1st";
                        case 1:
                          return "2nd";
                        case 2:
                          return "3rd";
                        default:
                          return "${index + 1}th";
                      }
                    }();
                    return ExpansionTile(
                      maintainState: true,
                      initiallyExpanded:
                          packageList[index] == packageList.last ? true : false,
                      title: Text("$packageRank Package Details"),
                      children: const [
                        VerifyDeliveryDetails(),
                      ],
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class VerifyDeliveryDetails extends StatefulWidget {
  const VerifyDeliveryDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<VerifyDeliveryDetails> createState() =>
      _VerifyDeliveryDetailsState();
}

class _VerifyDeliveryDetailsState extends State<VerifyDeliveryDetails> {
  bool _value = false;

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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _value = !_value;
                });
              },
              child: Container(
                  height: 16.w,
                  width: 16.w,
                  decoration: BoxDecoration(
                    color: _value ? TravaColors.black : TravaColors.white,
                    border: Border.all(width: 1.0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: _value
                      ? const FittedBox(
                          child: Icon(
                            Icons.check,
                            // size: 30.0,
                            color: Colors.white,
                          ),
                        )
                      : const SizedBox()),
            ),
            SizedBox(width: 8.w),
            Text(
              "Verify package delivery",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: TravaColors.black),
            ),
          ],
        ),
      ],
    );
  }
}