import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/request/delivered_response.dart';
import 'package:trava/screens/history_screen/components/delivered_package_details_screen.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/picked_up_screen/pickedup_screen.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/helpers.dart';

class PickedUpTabView extends StatelessWidget {
  const PickedUpTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return Expanded(
      child: SizedBox(
        child: Scrollbar(
            child:
                //  ValueListenableBuilder<Future<HistoryDeliveredResponse?>?>(
                //   valueListenable: model.delievered,
                //   builder: (context, data, ___) {
                //     return FutureBuilder<HistoryDeliveredResponse?>(
                //       future: data,
                //       builder: (context, snapshot) {
                //         if (snapshot.connectionState == ConnectionState.waiting &&
                //             snapshot.data == null) return const Apploader();
                //         if (snapshot.hasError && snapshot.data == null) {
                //           return TravaErrorState(
                //             errorMessage: parseError(
                //               snapshot.error,
                //               "We could not fetch delivery history",
                //             ),
                //             onRetry: () {},
                //           );
                //         }
                //         return
                ListView.builder(
          itemCount: 10, //snapshot.data?.data?.length ?? 0,
          itemBuilder: (context, index) {
            // Data? packageDetails = snapshot.data?.data?[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 15.0.h),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        const TextSpan(
                            text:
                                "You delivered Package (154) sent by Akintade Olaoluwa and was delivered by Tayo Akinola. "),
                        TextSpan(
                          text: "See Details",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context,
                                  PickedUpScreen.routeName,
                                  arguments: [1]);
                            },
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
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
          },
        )
            //   },
            // );
            //},
            // ),
            ),
      ),
    );
  }
}
