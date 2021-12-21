import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/picked_up_screen/component/picked_up_details_view.dart';
import 'package:trava/widgets/buttons/back_button.dart';

class PickedUpScreen extends StatelessWidget {
  static const routeName = '/pickedup';
  const PickedUpScreen(
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
                  Text("Package 023 Details",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: PickedUpDetailsView(
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