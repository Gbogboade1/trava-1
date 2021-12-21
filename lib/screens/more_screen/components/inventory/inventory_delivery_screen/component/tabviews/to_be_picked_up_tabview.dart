import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/request/tbd_response.dart';
import 'package:trava/screens/history_screen/components/to_be_delivered_package_details_screen.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/verify_pickup_screen/verify_pickup_screen.dart';
import 'package:trava/services/http/request/request_http_service.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/helpers.dart';

class ToBePickedUpTabView extends HookWidget {
  ToBePickedUpTabView({
    Key? key,
  }) : super(key: key);

  final RequestHttpService _httpService = RequestHttpService();
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return Expanded(
      child: SizedBox(
          child: Scrollbar(
        child:
            // ValueListenableBuilder<Future<HistoryTBDResponse?>?>(
            //   valueListenable: model.toBeDeliveried,
            //   builder: (context, data, ___) {
            //     return FutureBuilder<HistoryTBDResponse?>(
            //         future: data,
            //         builder: (context, snapshot) {
            //           if (snapshot.connectionState == ConnectionState.waiting &&
            //               snapshot.data == null) return const Apploader();
            //           if (snapshot.hasError && snapshot.data == null) {
            //             return TravaErrorState(
            //               errorMessage: parseError(
            //                 snapshot.error,
            //                 "We could not fetch sent history",
            //               ),
            //               onRetry: () {},
            //             );
            //           }
            // return
            ListView.builder(
          itemCount: 10, //snapshot.data!.data?.length ?? 0,
          itemBuilder: (context, index) {
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
                                "Package (154) from Akintade Olaoluwa is yet to be picked up. "),
                        TextSpan(
                          text: "Verify Package Pickup",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context,
                                  VerifyPickUpScreen.routeName,
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
        ),
        //}
      )
          // },
          ),
    );
    //   ),
    // );
  }
}
