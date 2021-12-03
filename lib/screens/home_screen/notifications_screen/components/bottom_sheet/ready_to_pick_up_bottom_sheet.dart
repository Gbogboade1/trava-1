import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/package_details_view.dart';

class ReadyToPickUpPackageBottomSheet extends StatelessWidget {
  const ReadyToPickUpPackageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 636.h,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(10.w),
                //width: 32.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  size: 20.h,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(24.w, 15.h, 24.w, 25.h),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                ),
                child: const PackageDetailsView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
