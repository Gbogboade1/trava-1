import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/verify_delivery_screen/verify_delivery_screen.dart';

class ToBeReceivedTile extends StatelessWidget {
  const ToBeReceivedTile(
    this.data, {
    Key? key,
  }) : super(key: key);
  final Data data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0.h),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SvgPicture.asset(
          'assets/images/baggage.svg',
        ),
        SizedBox(width: 17.w),
        Flexible(
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: const Color(0xff171718),
                  ),
              children: [
                TextSpan(
                    text:
                        "Package (${data.deliveryCode}) is to be delivered to your hub by  ${data.deliverer!.firstName} ${data.deliverer!.lastName} . You will be paid ₦300 for this delivery. "),
                TextSpan(
                  text: "Verify Package Delivery ",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(
                        context,
                        VerifyDeliveryScreen.routeName,
                        arguments: [1, 2],
                      );
                    },
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: const Color(0xff171718),
                        decoration: TextDecoration.underline,
                      ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
