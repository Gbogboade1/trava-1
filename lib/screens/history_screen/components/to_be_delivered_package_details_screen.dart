import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/widgets/buttons/back_button.dart';
import 'package:trava/widgets/package_details_view.dart';

class ToBeDeliveredPackageDetailsScreen extends StatelessWidget {
  static const routeName =  '/to-be-delivered-package-details';
  const ToBeDeliveredPackageDetailsScreen(
    this.arguments, {
    Key? key,
  }) : super(key: key);

  final List arguments;
  @override
  Widget build(BuildContext context) {
    List packageList = arguments;
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
                  Text("Delivered Package(s)",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: PackageDetailsView(
                  packageList: packageList,
                ),
              ),
         
            ],
          ),
        ),
      ),
    );
  }
}
