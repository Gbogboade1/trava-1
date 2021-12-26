import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/verify_delivery_screen/verify_delivery_screen.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/modals.dart';

class ToBeReceivedTile extends StatelessWidget {
  const ToBeReceivedTile(
    this.data, {
    Key? key,
  }) : super(key: key);
  final Data data;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return (data.isDropped ?? false)
        ? Padding(
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
                              arguments: data,
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
          )
        : Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/speaker.svg"),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Package (${data.deliveryCode}) is to be dropped off in your hub by ${data.sender?.firstName ?? ""} ${data.sender?.lastName ?? ""}",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: TravaColors.black,
                            ),
                      ),
                      SizedBox(height: 16.h),
                      InkWell(
                        onTap: () {
                          showAreYouSureBottomSheet(
                            context,
                            description:
                                "Are you sure Package(${data.deliveryCode}) has been dropped-off to your hub?",
                            onNoTap: () => Navigator.pop(context),
                            onYesTap: () async {
                              Navigator.pop(context);
                              final result = await formSubmitDialog(
                                context: context,
                                future: model.verifyDropOff({
                                  "packageId": data.sId,
                                  "hubId": data.hub,
                                }),
                                prompt: "Verifying pick up by recipient...",
                              );
                              if (result != null) {
                                Navigator.of(context).pop();
                                model.toBeReceived.value = null;
                                model.toBePickedInventory.value = null;
                                showNotificationBottomSheet(context,
                                    title:
                                        "Package Picked up by recipient Verified!");
                              }
                            },
                          );
                          // showModalBottomSheet(
                          //   isScrollControlled: true,
                          //   backgroundColor: Colors.transparent,
                          //   context: context,
                          //   builder: (context) =>
                          //       ReadyToPickUpPackageBottomSheet(),
                          // );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Center(
                            child: Text(
                              "Confirm package droff-off",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
