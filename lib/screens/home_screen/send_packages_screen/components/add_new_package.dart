import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/utilities/constants.dart';

class AddNewPackageButton extends StatelessWidget {
  const AddNewPackageButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          
          children: [
            Icon(Icons.add_circle_outline, size: 16.w, color: kGray2),
            SizedBox(width: 7.w),
            Text(
              "Add new package",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: kGray2,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
