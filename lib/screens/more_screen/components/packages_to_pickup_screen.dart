import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/spacers/text_styles.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/request/items_to_pick_up_response.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/screens/more_screen/components/pick_up_details_bottom_sheet.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/widgets/buttons/back_button.dart';

class PackagesToPickUpScreen extends StatelessWidget {
  static const routeName = '/packages-to-pick-up';
  const PackagesToPickUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 27.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  const Spacer(),
                  Text("Package(s) to pickup",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: ValueListenableBuilder<Future<ItemsToPickUpResponse?>?>(
                  valueListenable: model.toBePicked,
                  builder: (context, task, ___) {
                    return FutureBuilder<ItemsToPickUpResponse?>(
                      future: task,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            snapshot.data == null) return const Apploader();
                        if (snapshot.hasError && snapshot.data == null) {
                          return TravaErrorState(
                            errorMessage: parseError(
                              snapshot.error,
                              "We could not fetch packages",
                            ),
                            onRetry: () => model.toBePicked =
                                ValueNotifier(model.getPackagesToBePicked()),
                          );
                        }

                        return GroupedListView<Data, dynamic>(
                          elements: snapshot.data?.data ?? [],
                          groupBy: (Data element) => TravaFormatter.formatDate(
                              (element.createdAt ?? '')),
                          groupSeparatorBuilder: (value) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              value,
                              style: TravaTextStyle.medium.copyWith(
                                fontSize: 15,
                                color: TravaColors.lightGrey,
                              ),
                            ),
                          ),
                          itemBuilder: (context, Data element) => Padding(
                            padding:
                                EdgeInsets.only(bottom: 16.0.h, top: 14.0.h),
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
                                                "You’re to pickup Package (${element.deliveryCode}) to be delivered at ${element.deliveryHub}, ${element.destTown}, ${element.destState} State  on ${TravaFormatter.formatDate(element.deliveryDate ?? DateTime.now().toString())}. by  ${TravaFormatter.formatTime(element.deliveryDate ?? DateTime.now().toString())} today. pickup code is ${element.pickupCode}.",
                                          ),
                                          TextSpan(
                                            text: "See Package Details",
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) =>
                                                      PickUpDetailsBottomSheet(
                                                    element,
                                                  ),
                                                );
                                              },
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  color:
                                                      const Color(0xff171718),
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ),

                          itemComparator: (Data item1, Data item2) =>
                              (item1.createdAt ?? '')
                                  .compareTo(item2.createdAt ?? ''), // optional
                          useStickyGroupSeparators: false, // optional
                          floatingHeader: false, // optional
                        );
                        // SingleChildScrollView(
                        //                         child: Column(
                        //                             //List of tp pickup packages sorted by date
                        //                             children: [
                        //                               const PackagesToPickUpPerDay(),
                        //                             ] // would take a date and a list of packages for that day.
                        //                             ),
                        //                       );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PackagesToPickUpPerDay extends StatelessWidget {
  const PackagesToPickUpPerDay({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "12-05-2021",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primaryVariant,
          ),
        ),
        SizedBox(height: 8.h),
        ...List.generate(
          5,
          (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.0.h),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SvgPicture.asset(
                  'assets/images/baggage.svg',
                ),
                SizedBox(width: 17.w),
                Flexible(
                  child: Text(
                    "You’re to pickup Package (154) to be delivered at DHL Hub, Asaba, Delta State on 28-03-2021. by 5:00 pm today.  Payment code is 23940875.",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: const Color(0xff171718),
                        ),
                  ),
                ),
              ]),
            );
            //  return const PaidNotificationTile();
          },
        ),
      ],
    );
  }
}
