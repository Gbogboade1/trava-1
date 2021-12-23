// import 'dart:async';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/components/fragments/indicators/dialog_message.dart';
import 'package:trava/components/fragments/spacers/app_selection_sheet.dart';

import 'package:trava/components/layouts/scaffolds/dialog_scaffold.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/typedefs.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/buttons/outlined_button.dart';
import 'package:trava/widgets/custom_bottom_sheet.dart';

import 'helpers.dart';

enum FutureState {
  loading,
  complete,
  fail,
}

Future<T?> formSubmitDialog<T>({
  required BuildContext context,
  required Future<T> future,
  String errorMessage =
      "An unexpected error occurred and the request failed, please try again",
  String prompt = "Processing My request",
  String? successMessage,
  bool forceErrorMessage = false,
}) async {
  ValueNotifier<FutureState> isResolved = ValueNotifier(FutureState.loading);
  final T? result = await showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        child: ValueListenableBuilder(
          valueListenable: isResolved,
          builder: (context, FutureState val, _) {
            return TravaDialogScaffold(
              future: future,
              child: FutureBuilder(
                future: future,
                builder: (context, res) {
                  if (res.hasData) {
                    WidgetsBinding.instance?.addPostFrameCallback(
                      (_) {
                        Timer(
                          Duration(
                              milliseconds:
                                  successMessage == null ? 500 : 3000),
                          () {
                            Navigator.of(context).pop(res.data);
                          },
                        );
                      },
                    );
                    if (successMessage == null) {
                      return const DialogMessage(
                        message: "",
                        messageType: MessageType.pending,
                      );
                    }
                    return DialogMessage(
                      message: successMessage,
                      messageType: MessageType.success,
                    );
                  }
                  if (res.hasError) {
                    WidgetsBinding.instance?.addPostFrameCallback(
                      (_) {
                        isResolved.value = FutureState.complete;
                      },
                    );

                    return DialogMessage(
                      message: parseError(res.error, errorMessage),
                      messageType: MessageType.error,
                    );
                  }
                  return DialogMessage(
                    message: prompt,
                    messageType: MessageType.pending,
                  );
                },
              ),
              showClose: isResolved.value != FutureState.loading,
            );
          },
        ),
        onWillPop: () async => isResolved.value == FutureState.complete,
      );
    },
  );
  return result;
}

//

// showAlert(
//   BuildContext context, {
//   Widget child,
// }) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(content: child);
//     },
//   );
// }

showSelectionSheet(
  BuildContext context, {
  String? title,
  List<SelectionData>? data,
  OnChanged<SelectionData>? onSelect,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SelectionBottomSheet(
        title: title,
        onSelect: onSelect,
        items: data,
      );
    },
    backgroundColor: TravaColors.transparent,
    isScrollControlled: true,
  );
}

Future showNotificationBottomSheet(BuildContext context,
    {String? title,
    String? message,
    String gif = "assets/images/success.gif",
    bool popContext = true,
    String buttonLabel = "Thank You"}) {
  if (popContext) Navigator.pop(context);
  return showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 25.h),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                gif,
                height: 120.h,
                width: 120.w,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                title!,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 9.h,
              ),
              message != null
                  ? Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: TravaColors.black,
                          ),
                    )
                  : const SizedBox(),
              SizedBox(
                height: 40.h,
              ),
              DefaultButton(
                isActive: true,
                buttonLabel: buttonLabel,
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      });
}

Future<dynamic> showAreYouSureBottomSheet(BuildContext context,
    {required String description,
    VoidCallback? onNoTap,
    VoidCallback? onYesTap}) {
  return showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.fromLTRB(25.w, 29.h, 25.w, 44.h),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/question.gif", width: 120.h),
              SizedBox(
                height: 24.h,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: Row(
                  children: [
                    Expanded(
                      child: TravaOutlinedButton(
                          buttonLabel: "No", onTap: onNoTap),
                    ),
                    SizedBox(width: 56.w),
                    Expanded(
                      child: DefaultButton(
                        buttonLabel: "Yes",
                        isActive: true,
                        onTap: onYesTap,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}

Future<dynamic> showTravaBottomSheet(BuildContext context,
    {required String title, required Widget content}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => CustomBottomSheet(
      title: title,
      content: content,
    ),
  );
}
