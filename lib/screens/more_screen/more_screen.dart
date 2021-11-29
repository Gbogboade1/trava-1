import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/utils/constants.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "More",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 8.h),
              Text(
                "Explore more features on Trava",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 33.5.h),
              const MoreListTile(title: "Items to pickup",),
              const MoreListTile(title: "Inventory",),
              const MoreListTile(title: "Edit Profile",),
              const MoreListTile(title: "Password Settings",),
              const MoreListTile(title: "IManage Linked Card(s)",),
              const MoreListTile(title: "Manage Linked Bank Account(s)",),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreListTile extends StatelessWidget {
  const MoreListTile({
    Key? key, required this.title, this.onTap,
  }) : super(key: key);

final String title;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyText1!.copyWith(color: kBlack)),
      contentPadding: EdgeInsets.zero,
      trailing: Icon(Icons.arrow_forward_ios,
          color: const Color(0xff4F4F4F), size: 10.h),
    );
  }
}
