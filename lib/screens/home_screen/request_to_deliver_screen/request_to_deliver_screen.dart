import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/home_screen/request_to_deliver_screen/components/request_to_deliver_info_page.dart';
import 'package:trava/widgets/buttons/back_button.dart';
import 'package:trava/widgets/buttons/default_button.dart';

class RequestToDeliverScreen extends StatefulWidget {
  static const routeName = '/request-to-deliver';
  const RequestToDeliverScreen({Key? key}) : super(key: key);

  @override
  _RequestToDeliverScreenState createState() => _RequestToDeliverScreenState();
}

class _RequestToDeliverScreenState extends State<RequestToDeliverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 27.h,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  const Spacer(),
                  Text("Request to deliver package(s)",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 24.h),
              const RequestToDeliverForm(),
              const DefaultButton(
                isActive: false,
                buttonLabel: "Request to deliver",
              )
            ],
          ),
        ),
      ),
    );
  }
}
