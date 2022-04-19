import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/models/https/request/sent_response.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/verify_pickup_screen/verify_pickup_screen.dart';
import 'package:trava/services/http/request/request_http_service.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_bottom_sheet.dart';

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
          child: ValueListenableBuilder<Future<HistorySentResponse?>?>(
            valueListenable: model.toBePickedInventory,
            builder: (context, data, ___) {
              return FutureBuilder<HistorySentResponse?>(
                  future: data,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        snapshot.data == null) return const Apploader();
                    if (snapshot.hasError && snapshot.data == null) {
                      return TravaErrorState(
                        errorMessage: parseError(
                          snapshot.error,
                          "We could not fetch sent history",
                        ),
                        onRetry: () => model.toBePickedInventory =
                            ValueNotifier(model.getToBePickedInventory()),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return (snapshot.data!.data![index].isPickuped!)
                            ? Padding(
                                padding: EdgeInsets.only(bottom: 15.0.h),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color:
                                                      const Color(0xff171718),
                                                ),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      "Package (${snapshot.data!.data![index].deliveryCode}) from ${snapshot.data!.data![index].sender!.firstName} ${snapshot.data!.data![index].sender!.lastName} is yet to be picked up by the recipient. "),
                                              TextSpan(
                                                text: "Verify Package Pickup",
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          VerifyPickUpScreen
                                                              .routeName,
                                                          arguments: snapshot
                                                              .data!
                                                              .data![index],
                                                        );
                                                      },
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4!
                                                    .copyWith(
                                                      color: const Color(
                                                          0xff171718),
                                                      decoration: TextDecoration
                                                          .underline,
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
                                    SvgPicture.asset(
                                        "assets/images/speaker.svg"),
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Package (${snapshot.data!.data![index].deliveryCode}) is to be picked up from your hub by ${snapshot.data!.data![index].sender?.firstName ?? ""} ${snapshot.data!.data![index].sender.lastName ?? ""}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  color: TravaColors.black,
                                                ),
                                          ),
                                          SizedBox(height: 16.h),
                                          InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) =>
                                                    VerifyPackageBottomSheet(
                                                        snapshot.data!
                                                            .data![index]),
                                              );
                                              showAreYouSureBottomSheet(context,
                                                  description:
                                                      "Are you sure Package(${snapshot.data!.data![index].deliveryCode}) has been picked up from your hub?",
                                                  onNoTap: () =>
                                                      Navigator.pop(context),
                                                  onYesTap: () {
                                                    Navigator.pop(context);
                                                  });
                                              // showModalBottomSheet(
                                              //   isScrollControlled: true,
                                              //   backgroundColor: Colors.transparent,
                                              //   context: context,
                                              //   builder: (context) =>
                                              //       ReadyToPickUpPackageBottomSheet(),
                                              // );
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.h),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Confirm package pick-up",
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
                      },
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}

class VerifyPackagePickUpBottomSheet extends HookWidget {
  VerifyPackagePickUpBottomSheet(
    this.arguments, {
    Key? key,
  }) : super(key: key);

  final Data arguments;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final codeController = useTextEditingController();
    final model = context.watch<AuthState>();
    return CustomBottomSheet(
      title: "Verify Package Delivery",
      content: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Package Delivery Code",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 8.h),
            TextFormField(
              controller: codeController,
              validator: (string) {
                if (string!.trim() != arguments.deliveryCode) {
                  return "Invalid code";
                }
              },
              keyboardType: TextInputType.number,
              decoration: kTextFieldDecoration.copyWith(
                hintText: "The deliverer will supply this",
              ),
            ),
            SizedBox(height: 40.h),
            DefaultButton(
              isActive: codeController.text.isNotEmpty ? true : false,
              buttonLabel: "Confirm verification",
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  final result = await formSubmitDialog(
                    context: context,
                    future: model.verifyPickup({
                      "packageId": arguments.sId,
                      "code": arguments.deliveryCode,
                      "hubId": arguments.hub,
                    }),
                    prompt: "Verifying  package delivery...",
                  );
                  if (result != null) {
                    Navigator.of(context).pop();
                    model.pickedUpInventory.value = null;
                    model.toBePickedInventory.value = null;
                    showNotificationBottomSheet(
                      context,
                      title: "Package Delivery Verified!",
                      onTap: () => Navigator.pop(context),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
