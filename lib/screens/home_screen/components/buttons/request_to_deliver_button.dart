import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/home_screen/request_to_deliver_screen/request_to_deliver_screen.dart';

class RequestToDeliverButton extends StatelessWidget {
  const RequestToDeliverButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RequestToDeliverScreen.routeName),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Center(
          child: Text(
            "Request to deliver package(s)",
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
      ),
    );
  }
}
