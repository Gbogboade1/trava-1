import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/components/fragments/spacers/app_sized_box.dart';
import 'package:trava/utils/constants.dart';

class OtpField extends HookWidget {
  final TextEditingController controller;
  final VoidCallback onValueChanged;
  OtpField(
    this.controller,
    this.onValueChanged, {
    Key? key,
  }) : super(key: key);

  void nextField(String? value, FocusNode? focusNode, FocusNode? previousNode) {
    if (value!.length == 1) {
      focusNode!.requestFocus();
      controller.text = controller.text + value;
    } else {
      if (previousNode != null) {
        previousNode.requestFocus();
      }
      controller.text =
          controller.text.substring(0, controller.text.length - 1);
    }
  }

  final List<int> otp = [];
  @override
  Widget build(BuildContext context) {
    final focus = [
      useFocusNode(),
      useFocusNode(),
      useFocusNode(),
      useFocusNode(),
      useFocusNode()
    ];

    final textController = [
      useTextEditingController(),
      useTextEditingController(),
      useTextEditingController(),
      useTextEditingController(),
      useTextEditingController()
    ];
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            5,
            (index) => SizedBox(
                  width: 53.w,
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    controller: textController[index],
                    autofocus: index == 0,
                    maxLength: 1,
                    focusNode: focus[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                    decoration: kOTPFieldDecoration.copyWith(
                      counter: const TravaSizedBox(),
                    ),
                    onChanged: (value) {
                      if (index == focus.length - 1) {
                        focus[index].unfocus();
                        if (value.length == 1) {
                          controller.text = controller.text + value;
                        } else {
                          focus[index - 1].requestFocus();
                          controller.text = controller.text
                              .substring(0, controller.text.length - 1);
                        }
                      } else {
                        nextField(value, focus[index + 1],
                            index == 0 ? null : focus[index - 1]);
                      }
                      onValueChanged();
                      log(controller.text);
                    },
                  ),
                )),
      ),
    );
  }
}
