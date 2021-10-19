import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/utilities/constants.dart';

class OtpField extends StatelessWidget {
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
    return Form(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        width: 53.w,
        child: TextFormField(
          autofocus: true,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
          decoration: kOTPFieldDecoration,
          onChanged: (value) {
            otp.add(int.parse(value));
            nextField(value, pin2FocusNode);
          },
        ),
      ),
      SizedBox(
        width: 53.w,
        child: TextFormField(
          focusNode: pin2FocusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
          decoration: kOTPFieldDecoration,
          onChanged: (value) {
            otp.add(int.parse(value));
            nextField(value, pin3FocusNode);
          },
        ),
      ),
      SizedBox(
        width: 53.w,
        child: TextFormField(
          focusNode: pin3FocusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
          decoration: kOTPFieldDecoration,
          onChanged: (value) {
            otp.add(int.parse(value));
            nextField(value, pin4FocusNode);
          },
        ),
      ),
      SizedBox(
        width: 53.w,
        child: TextFormField(
          focusNode: pin3FocusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
          decoration: kOTPFieldDecoration,
          onChanged: (value) {
            otp.add(int.parse(value));
            nextField(value, pin5FocusNode);
          },
        ),
      ),
      SizedBox(
        width: 53.w,
        child: TextFormField(
          focusNode: pin5FocusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
          decoration: kOTPFieldDecoration,
          onChanged: (value) {
            otp.add(int.parse(value));
            pin5FocusNode.unfocus();
          },
        ),
      ),
    ]));
  }
}
