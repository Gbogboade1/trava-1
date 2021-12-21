import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/verify_delivery_screen/component/verify_delivery_details_view.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/widgets/buttons/back_button.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_bottom_sheet.dart';

class VerifyDeliveryScreen extends StatelessWidget {
  static const routeName = '/verify-delivery';
  const VerifyDeliveryScreen(
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
                  Text("Verify Package Delivery",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: VerifyDeliveryDetailsView(
                  packageList: packageList,
                ),
              ),
              SizedBox(height: 54.h),
              DefaultButton(
                isActive: true, // false,
                buttonLabel: "Submit for verification",
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => const VerifyPackageBottomSheet(),
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

class VerifyPackageBottomSheet extends HookWidget {
  const VerifyPackageBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final codeController = useTextEditingController();
    return CustomBottomSheet(
      
      title: "Verify Package Delivery",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Package Delivery Code",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            controller: codeController,
            keyboardType: TextInputType.number,
            decoration: kTextFieldDecoration.copyWith(
              hintText: "The deliverer will supply this",
            ),
          ),
          SizedBox(height: 40.h),
          DefaultButton(
            isActive: codeController.text.isNotEmpty ? true : false,
            buttonLabel: "Confirm verification",
            onTap: () {
              showNotificationBottomSheet(context,
                  title: "Package Delivery Verified!");
            },
          )
        ],
      ),
    );
  }
}
