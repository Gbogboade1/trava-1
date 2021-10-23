import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OperationsListView extends StatelessWidget {
  const OperationsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Row(
            children: [
              const Icon(Icons.arrow_circle_down),
              SizedBox(width: 16.w),
              Flexible(
                child: Text(
                  "Your Package (023) has been delivered at DHL Hub, Asaba, Delta State at 12:02pm",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: const Color(0xff171718),
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
