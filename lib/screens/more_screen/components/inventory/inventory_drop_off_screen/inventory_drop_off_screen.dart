import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_drop_off_screen/components/pickup_details_bottom_sheet.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_drop_off_screen/components/verify_for_drop_off.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_drop_off_screen/components/verify_for_pickup.dart';
import 'package:trava/screens/more_screen/components/more_list_tile.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/widgets/buttons/back_button.dart';

class InventoryDropOffScreen extends StatelessWidget {
  static const String routeName = "/inventory-drop-off-screen";
  const InventoryDropOffScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 27.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Inventory",
                            style: Theme.of(context).textTheme.headline2),
                        TextSpan(
                            text: " — Drop-off",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 16.sp, color: TravaColors.black)),
                      ],
                    ),
                  ),
                  const Spacer()
                ],
              ),
              SizedBox(height: 16.h),
              MoreListTile(
                title: "Verify Package for Drop-off",
                onTap: () {
                  showTravaBottomSheet(
                    context,
                    title: "Verify Package for Drop-off",
                    content: const VerifyForDropOff(),
                  );
                },
              ),
              SizedBox(height: 8.h),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "Search Traveller’s name or package number",
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 20,
                          ),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffF2F2F2)),
                      child: const Center(
                          child: Icon(
                        Icons.filter_list_rounded,
                        size: 20,
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                TravaFormatter.formatDate('${DateTime.now()}'),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/images/baggage.svg"),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: RichText(
                                      text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              color: const Color(0xff171718),
                                            ),
                                        children: [
                                          const TextSpan(
                                              text:
                                                  "Package (154) is to be picked up from your hub by Aladetimi Tomiwa. "),
                                          TextSpan(
                                            text: "View Package Details",
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                showTravaBottomSheet(
                                                  context,
                                                  title: "Package 023 Details",
                                                  content:
                                                      const PickUpPackageDetailsBottomSheet(),
                                                );
                                              },
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  color:
                                                      const Color(0xff171718),
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  InkWell(
                                    onTap: () {
                                      showTravaBottomSheet(
                                        context,
                                        title: "Verify Package for Pickup",
                                        content: const VerifyForPickUp(),
                                      );
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Verify package for pickup",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
