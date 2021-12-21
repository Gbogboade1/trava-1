import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {Key? key, required this.content, required this.title})
      : super(key: key);

  final Widget content;

  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          Container(
            padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 25.h),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                content,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
