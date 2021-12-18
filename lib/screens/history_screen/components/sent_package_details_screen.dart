import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/history_screen/components/track_package_screen.dart';
import 'package:trava/widgets/buttons/back_button.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/package_details_view.dart';
import 'package:trava/models/https/request/sent_response.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';

class SentPackageDetailsScreen extends StatelessWidget {
  static const routeName = '/sent-package-details';
  const SentPackageDetailsScreen(
    this.arguments, {
    Key? key,
  }) : super(key: key);

  final Data arguments;
  @override
  Widget build(BuildContext context) {
    // List packageList = arguments;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 27.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  const Spacer(),
                  Text("Sent Package(s)",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: PackageDetailsView(
                  package: arguments,
                ),
              ),
              DefaultButton(
                isActive: true,
                buttonLabel: "Track package",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    TrackPackageScreen.routeName,
                    arguments: arguments,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
