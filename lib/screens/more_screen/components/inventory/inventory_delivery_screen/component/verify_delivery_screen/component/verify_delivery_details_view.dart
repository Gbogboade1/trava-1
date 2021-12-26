import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/widgets/package_detail_field.dart';

class VerifyDeliveryDetailsView extends StatelessWidget {
  const VerifyDeliveryDetailsView({
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
        Expanded(child: VerifyDeliveryDetails(package)),
      ],
    );
  }
}

class VerifyDeliveryDetails extends StatefulWidget {
  const VerifyDeliveryDetails(
    this.package, {
    Key? key,
  }) : super(key: key);
  final Data package;
  @override
  State<VerifyDeliveryDetails> createState() => _VerifyDeliveryDetailsState();
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
          "${widget.package.description}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: PackageDetailField(
                title: "Package Type:",
                value: "${widget.package.type} Weight",
              ),
            ),
            Expanded(
              child: PackageDetailField(
                title: "Package Quantity:",
                value: "${widget.package.quantity}",
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
                value:
                    "${widget.package.destTown}, ${widget.package.destState} State",
              ),
            ),
            Expanded(
              child: PackageDetailField(
                title: "Package Delivery Date:",
                value: TravaFormatter.formatDate(
                    widget.package.deliveryDate ?? DateTime.now().toString()),
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
                value: "${widget.package.deliveryMode}",
              ),
            ),
            Expanded(
              child: PackageDetailField(
                title: "Preferred Delivery Hub:",
                value: "${widget.package.deliveryHub}",
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
                    "${widget.package.deliverer?.firstName} ${widget.package.deliverer?.lastName}",
              ),
            ),
            Expanded(
              child: PackageDetailField(
                title: "Deliverer’s Phone Number:",
                value: "${widget.package.deliverer?.phone}",
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
                    "${widget.package.sender?.firstName} ${widget.package.sender?.lastName}",
              ),
            ),
            Expanded(
              child: PackageDetailField(
                title: "Sender’s Phone Number:",
                value: "${widget.package.sender?.phone}",
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
