import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/hooks/profile_data_listening_widget.dart';
import 'package:trava/screens/manage_hub_screen/manage_hub_screen.dart';
import 'package:trava/screens/more_screen/components/edit_profile_bottom_sheet.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/inventory_delivery_screen.dart';
import 'package:trava/screens/more_screen/components/linked_bank_account_bottom_sheet.dart';
import 'package:trava/screens/more_screen/components/linked_card_bottom_sheet.dart';
import 'package:trava/screens/more_screen/components/more_list_tile.dart';
import 'package:trava/screens/more_screen/components/packages_to_pickup_screen.dart';
import 'package:trava/screens/more_screen/components/password_settings_bottom_sheet.dart';
import 'package:trava/screens/register_hub_screen/register_hub_screen.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/widgets/buttons/outlined_button.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    var availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return ProfileSetUpDataListeningWidget(
      builder: (context, data) => SafeArea(
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
                  (data?.user?.hubs?.isNotEmpty ?? false)
                      ? MoreListTile(
                          title: "Inventory",
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              InventoryDeliveryScreen.routeName,
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
                  if ((data?.user?.hubs?.isEmpty ?? true)) ...[
                    Text(
                      "Want to serve as an Hub for Trava?",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text("You get to earn per item",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color:
                                Theme.of(context).colorScheme.primaryVariant)),
                    SizedBox(height: 24.h),
                    TravaOutlinedButton(
                      buttonLabel: "Register as a hub",
                      onTap: () => Navigator.pushNamed(
                          context, RegisterHubScreen.routeName),
                    ),
                  ] else ...[
                    Text(
                      "Want to manage your Hub?",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Manage your hub by tapping ",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                        children: [
                          TextSpan(
                            text: "\"Manage my hub\"",
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: const Color(0xff171718),
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          TextSpan(
                            text: " button below",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    TravaOutlinedButton(
                      buttonLabel: "Manage my hub",
                      onTap: () {
                        

 Navigator.pushNamed(
                          context, ManageHubScreen.routeName);},
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
      ),
    );
  }
}
