import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/validators.dart';
import 'package:trava/widgets/buttons/back_button.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_scaffold.dart';
import 'package:trava/widgets/trava_dropdown.dart';

class RegisterHubScreen extends StatelessWidget {
  static const routeName = '/register-hub';
  const RegisterHubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton(),
          SizedBox(height: 16.h),
          Text(
            "Register your hub",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 8.h),
          Text(
            "Please fill the fields below to register your hub",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 16.h),
          Text(
            "Hub Name",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            //   controller: _passwordController,
            decoration: kTextFieldDecoration.copyWith(
              hintText: "The name of your hub",
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "Description",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 8.h),
          Container(
            height: 88.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: const Color(0xffefefef).withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: null,
              maxLines: null,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: kGray1),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "A short information of your hub",
                hintStyle: TextStyle(
                    color: const Color(0xff828282),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "State",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            TextEditingController(),
            validator: TravaValidators.required,
            items: const [],
            hintText: "Choose the state your hub in located at",
          ),
          SizedBox(height: 16.h),
          Text(
            "City/Town",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            TextEditingController(),
            validator: TravaValidators.required,
            items: const [],
            hintText: "Choose the city/town your hub in located at",
          ),
          SizedBox(height: 16.h),
          Text(
            "Upload hub picture(s)",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          Container(
            decoration: DottedDecoration(
              shape: Shape.box,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              color: const Color(0xffEFEFEF).withOpacity(0.5),
              padding: EdgeInsets.symmetric(vertical: 33.h),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: kGray3,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300),
                    children: [
                      TextSpan(
                          text: "Tap here",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  decoration: TextDecoration.underline,
                                  color: kGray3)),
                      const TextSpan(text: " to upload hub picture(s)"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 27.h),
          DefaultButton(
            isActive: true,
            buttonLabel: "Register Hub",
            onTap: () async {
              Navigator.of(context).pop();
              //TODO: register hub
              showNotificationBottomSheet(
                context,
                title: "Hub Successful Registered",
                message:
                    "Your hub has been successfully registered. You’ll get a notification when your registration has been verified.",
              );
            },
          )
        ],
      ),
    );
  }
}
