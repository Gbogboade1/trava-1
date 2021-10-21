import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/navigation.dart';
import 'package:trava/utilities/constants.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_scaffold.dart';

import 'components/back_button.dart';

class NewPasswordScreen extends StatelessWidget {
  static const String routeName = "/new_password";
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton(),
          SizedBox(height: 16.h),
          Text(
            "Forgot Password?",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 8.h),
          Text(
            "Don’t fret. We’ve got you covered",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 32.h),
          Text(
            "New Password",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            decoration: kTextFieldDecoration.copyWith(
              hintText: "Your new password",
              suffixIcon: Icon(
                Icons.visibility_outlined,
                color: const Color(0xffBDBDBD),
                size: 20.h,
              ),
            ),
          ),
          SizedBox(height: 56.h),
          DefaultButton(
            isActive: true,
            buttonLabel: "Submit and Log me in",
            onTap: () {
              //TODO: implement password update and log user in
              Navigator.pushNamed(context, Navigation.routeName);
            },
          )
        ],
      ),
    );
  }
}
