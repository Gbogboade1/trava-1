import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/request/delivered_response.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/screens/history_screen/components/delivered_package_details_screen.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/widgets/empty_list_state.dart';

class DeliveredTabView extends StatelessWidget {
  const DeliveredTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return Expanded(
      child: SizedBox(
        child: Scrollbar(
          child: ValueListenableBuilder<Future<HistoryDeliveredResponse?>?>(
            valueListenable: model.delievered,
            builder: (context, data, ___) {
              return FutureBuilder<HistoryDeliveredResponse?>(
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      snapshot.data == null) return const Apploader();
                  if (snapshot.hasError && snapshot.data == null) {
                    return TravaErrorState(
                      errorMessage: parseError(
                        snapshot.error,
                        "We could not fetch delivery history",
                      ),
                      onRetry: () {},
                    );
                  }
                  return snapshot.data!.data!.isNotEmpty
                      ? ListView.builder(
                          itemCount: snapshot.data?.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            Data? packageDetails = snapshot.data?.data?[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 15.0.h),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/baggage.svg',
                                    ),
                                    SizedBox(width: 17.w),
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                color: const Color(0xff171718),
                                              ),
                                          children: [
                                            TextSpan(
                                                text:
                                                    "Your package (${packageDetails?.deliveryCode ?? ''})  to be delivered at ${packageDetails?.deliveryHub ?? ''}, ${packageDetails?.destTown ?? ''}, ${packageDetails?.destState ?? ''} State by ${packageDetails?.sender?.lastName ?? ''} ${packageDetails?.sender?.firstName ?? ''}. "),
                                            TextSpan(
                                              text: "See Details",
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.pushNamed(
                                                    context,
                                                    DeliveredPackageDetailsScreen
                                                        .routeName,
                                                    arguments: snapshot
                                                        .data!.data![index],
                                                  );
                                                },
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                    color:
                                                        const Color(0xff171718),
                                                    decoration: TextDecoration
                                                        .underline,
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
                      : const Center(child: EmptyListState());
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
