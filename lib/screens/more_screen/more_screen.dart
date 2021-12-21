import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/more_screen/components/edit_profile_bottom_sheet.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/inventory_delivery_screen.dart';

import 'package:trava/screens/more_screen/components/linked_bank_account_bottom_sheet.dart';
import 'package:trava/screens/more_screen/components/linked_card_bottom_sheet.dart';
import 'package:trava/screens/more_screen/components/packages_to_pickup_screen.dart';
import 'package:trava/screens/register_hub_screen/register_hub_screen.dart';
import 'package:trava/screens/more_screen/components/password_settings_bottom_sheet.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/widgets/buttons/outlined_button.dart';
import 'package:trava/widgets/custom_bottom_sheet.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);
  final bool hubCreated = true;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    var availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 27.h,
          ),
          child: SizedBox(
            height: availableHeight - 45.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                MoreListTile(
                  title: "Items to pickup",
                  onTap: () {
                    Navigator.pushNamed(
                        context, PackagesToPickUpScreen.routeName);
                  },
                ),
                hubCreated
                    ? MoreListTile(
                        title: "Inventory",
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => CustomBottomSheet(
                                title: "Inventory Categories",
                                content: Column(children: [
                                  MoreListTile(
                                    title: "Drop-off",
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          PackagesToPickUpScreen.routeName);
                                    },
                                  ),
                                  SizedBox(height: 16.h),
                                  MoreListTile(
                                    title: "Delivery",
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          InventoryDeliveryScreen.routeName);
                                    },
                                  ),
                                ])),
                          );
                        },
                      )
                    : const SizedBox(),
                MoreListTile(
                  title: "Edit Profile",
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => EditProfileBottomSheet(),
                    );
                  },
                ),
                MoreListTile(
                  title: "Password Settings",
                  onTap: () async => await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => PasswordSettingBottomSheet(),
                  ),
                ),
                MoreListTile(
                  title: "Manage Linked Card(s)",
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => const CardSettingsBottomSheet(),
                    );
                  },
                ),
                MoreListTile(
                  title: "Manage Linked Bank Account(s)",
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => const BankAccountsBottomSheet(),
                    );
                  },
                ),
                SizedBox(height: 73.5.h),
                if (!hubCreated) ...[
                  Text(
                    "Want to serve as an Hub for Trava?",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text("You get to earn per item",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).colorScheme.primaryVariant)),
                  SizedBox(height: 24.h),
                  TravaOutlinedButton(
                    buttonLabel: "Register as a hub",
                    onTap: () => Navigator.pushNamed(
                        context, RegisterHubScreen.routeName),
                  ),
                ],
                const Spacer(),
                InkWell(
                  onTap: () async => await model.logout(context),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.logout,
                          size: 15.w,
                          color: const Color(0xffF43232),
                        ),
                        SizedBox(width: 9.w),
                        Text(
                          "Logout",
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: const Color(0xffF43232),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MoreListTile extends StatelessWidget {
  const MoreListTile({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
