import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/utils/constants.dart';

class OtpField extends HookWidget {
  OtpField({
    Key? key,
  }) : super(key: key);

  void nextField(String? value, FocusNode? focusNode) {
    if (value!.length == 1) {
      focusNode!.requestFocus();
    }
  }

  final List<int> otp = [];
  @override
  Widget build(BuildContext context) {
    final pin2FocusNode = useFocusNode();
    final pin3FocusNode = useFocusNode();
    final pin4FocusNode = useFocusNode();
    final pin5FocusNode = useFocusNode();
    final textController1 = useTextEditingController();
    final textController2 = useTextEditingController();
    final textController3 = useTextEditingController();
    final textController4 = useTextEditingController();
    final textController5 = useTextEditingController();
    return Form(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        width: 53.w,
        child: TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          controller: textController1,
          autofocus: true,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
          decoration: kOTPFieldDecoration,
          onChanged: (value) {
            nextField(value, pin2FocusNode);
          },
        ),
      ),
      SizedBox(
        width: 53.w,
        child: TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          controller: textController2,
          focusNode: pin2FocusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
          decoration: kOTPFieldDecoration,
          onChanged: (value) {
            nextField(value, pin3FocusNode);
          },
        ),
      ),
      SizedBox(
        width: 53.w,
        child: TextFormField(
          controller: textController3,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          focusNode: pin3FocusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
          decoration: kOTPFieldDecoration,
          onChanged: (value) {
            nextField(value, pin4FocusNode);
          },
        ),
      ),
      SizedBox(
        width: 53.w,
        child: TextFormField(
          controller: textController4,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          focusNode: pin4FocusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
          decoration: kOTPFieldDecoration,
          onChanged: (value) {
            nextField(value, pin5FocusNode);
          },
        ),
      ),
      SizedBox(
        width: 53.w,
        child: TextFormField(
          controller: textController5,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          focusNode: pin5FocusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
          decoration: kOTPFieldDecoration,
          onChanged: (value) {
            pin5FocusNode.unfocus();
          },
        ),
      ),
    ]));
  }
}
