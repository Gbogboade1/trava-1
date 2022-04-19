import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/verify_pickup_screen/component/verify_pickup_details_view.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/widgets/buttons/back_button.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_bottom_sheet.dart';

class VerifyPickUpScreen extends StatelessWidget {
  static const routeName = '/verify_pickup';
  const VerifyPickUpScreen(
    this.arguments, {
    Key? key,
  }) : super(key: key);

  final Data arguments;

  @override
  Widget build(BuildContext context) {
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
                  Text("Verify Package Pickup",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: VerifyPickUpDetailsView(arguments),
              ),
              DefaultButton(
                isActive: true, // false,
                buttonLabel: "Submit for pickup verification",
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => VerifyPackageBottomSheet(arguments),
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
  VerifyPackageBottomSheet(
    this.arguments, {
    Key? key,
  }) : super(key: key);

  final Data arguments;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final codeController = useTextEditingController();
    final model = context.watch<AuthState>();
    return CustomBottomSheet(
      title: "Verify Package Pickup",
      content: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "pickup Code",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 8.h),
            TextFormField(
              controller: codeController,
              validator: (string) {
                if (string != arguments.deliveryCode) {
                  return "Invalid code";
                }
              },
              keyboardType: TextInputType.number,
              decoration: kTextFieldDecoration.copyWith(
                hintText: "The deliverer will supply this",
              ),
            ),
            SizedBox(height: 40.h),
            DefaultButton(
              isActive: codeController.text.isNotEmpty ? true : false,
              buttonLabel: "Confirm verification",
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  final result = await formSubmitDialog(
                    context: context,
                    future: model.verifyReceived({
                      "code": codeController.text,
                      "packageId": arguments.sId,
                      "hubId": arguments.hub,
                    }),
                    prompt: "Verifying pick up by recipient...",
                  );
                  if (result != null) {
                    Navigator.of(context).pop();
                    model.pickedUpInventory.value = null;
                    model.toBePickedInventory.value = null;
                    showNotificationBottomSheet(context,
                        title: "Package Picked up by recipient Verified!");
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
