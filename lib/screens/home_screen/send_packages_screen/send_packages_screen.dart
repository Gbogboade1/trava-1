import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/hubs/hubs.dart';
import 'package:trava/models/podos/send_package_controllers.dart';
import 'package:trava/screens/home_screen/send_packages_screen/components/send_package_info_page.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/widgets/buttons/back_button.dart';
import 'package:trava/widgets/buttons/default_button.dart';

class SendPackagesScreen extends HookWidget {
  static const String routeName = "/send_payments";

  SendPackagesScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> keys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final packageList = useState<int>(0);
    final model = context.watch<AuthState>();

    var controllers = useState(SendControllers());
    return Scaffold(
      body: ValueListenableBuilder<Future<Hubs?>?>(
        valueListenable: model.hubs,
        builder: (context, future, child) {
          return FutureBuilder<Hubs?>(
            future: future,
            builder: (context, data) {
              if (data.connectionState == ConnectionState.waiting &&
                  data.data == null) return const Apploader();
              if (data.hasError && data.data == null) {
                return TravaErrorState(
                  errorMessage: parseError(
                    data.error,
                    "We could not fetch hubs",
                  ),
                  onRetry: () =>
                      model.hubs = ValueNotifier(model.getHubsFromOnline()),
                );
              }
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 27.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CustomBackButton(),
                          const Spacer(),
                          Text("Send Package(s)",
                              style: Theme.of(context).textTheme.headline2),
                          const Spacer()
                        ],
                      ),
                      SizedBox(height: 24.h),
                      ...[
                        if (packageList.value == 0)
                          Expanded(
                            child: SendPackageInfoPage(
                              data.data!,
                              keys,
                              controllers.value,
                              offstage: !false,
                              onPackageButtonTapped: () {
                                // keys.value.add(GlobalKey());
                                // packageList.value++;
                                // log("key -- ength -- ${keys.value.length}");
                              },
                            ),
                          )
                        // else
                        // Expanded(
                        //   child: ListView.builder(
                        //     itemCount: packageList.value + 1,
                        //     itemBuilder: (context, index) {
                        //       String packageRank = () {
                        //         switch (index) {
                        //           case 0:
                        //             return "1st";
                        //           case 1:
                        //             return "2nd";
                        //           case 2:
                        //             return "3rd";
                        //           default:
                        //             return "${index + 1}th";
                        //         }
                        //       }();
                        //       return ExpansionTile(
                        //         maintainState: true,
                        //         initiallyExpanded: index == packageList.value,
                        //         title: Text("$packageRank Package Details"),
                        //         children: [
                        //           SendPackageInfoPage(
                        //             data.data!,
                        //             keys.value[index],
                        //             controllers.value[index],
                        //             onPackageButtonTapped: () {
                        //               keys.value.add(GlobalKey());
                        //               packageList.value++;
                        //               log("key -- ength -- ${keys.value.length}");
                        //             },
                        //             offstage: (index < 2)
                        //                 ? index != packageList.value
                        //                 : true,
                        //           ),
                        //         ],
                        //       );
                        //     },r
                        //   ),
                        // ),
                      ],
                      DefaultButton(
                          isActive: true,
                          buttonLabel: "Request for a deliverer",
                          onTap: () async {
                            if (keys.currentState!.validate() &&
                                controllers.value.image != null) {
                              showAreYouSureBottomSheet(
                                context,
                                description: "Are you sure that would be all?",
                                onNoTap: () => Navigator.pop(context),
                                onYesTap: () async {
                                  Navigator.pop(context);
                                  final result = await formSubmitDialog(
                                    context: context,
                                    future: model.getPackageCost(
                                      controllers.value,
                                    ),
                                    prompt: "Getting cost of delivery...",
                                  );
                                  if (result != null) {
                                    // showNotificationBottomSheet(context,
                                    //     title: "Request Successful",
                                    //     message:
                                    //         "You’ll be notified to make payment when someone accepts to deliver.",
                                    //     gif:
                                    //         "assets/images/congratulation_icon.gif",
                                    //     buttonLabel: "Okay");
                                      showAreYouSureBottomSheet(
                                context,
                                description: "You will be charge ${TravaFormatter.formatCurrency(result.data.toString())}, do you want to continue?",
                                onNoTap: () => Navigator.pop(context),
                                onYesTap: () async {
                                  Navigator.pop(context);
                                  final finalRes = await formSubmitDialog(
                                    context: context,
                                    future: model.sendPackage(
                                      controllers.value,
                                    ),
                                    prompt: "Sending request to deliverers.",
                                  );
                                  if (finalRes != null) {
                                    showNotificationBottomSheet(context,
                                        title: "Request Successful",
                                        message:
                                            "You’ll be notified to make payment when someone accepts to deliver.",
                                        gif:
                                            "assets/images/congratulation_icon.gif",
                                        buttonLabel: "Okay");
                                  }
                                },
                              );
                                  }
                                },
                              );
                            }
                          })
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
