// import 'dart:async';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trava/components/fragments/indicators/dialog_message.dart';
import 'package:trava/components/fragments/spacers/app_selection_sheet.dart';

import 'package:trava/components/layouts/scaffolds/dialog_scaffold.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/typedefs.dart';

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
