import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/tabviews/picked_up_tabview.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/tabviews/to_be_picked_up_tabview.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/tabviews/to_be_received_tabview.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/widgets/buttons/back_button.dart';

class InventoryDeliveryScreen extends HookWidget {
  static const String routeName = "/inventory-delivery-screen";
  const InventoryDeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
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
                            text: " — Delivery",
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
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                decoration: BoxDecoration(
                  color: const Color(0xffF2F2F2).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        currentIndex.value = 0;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentIndex.value == 0
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: const Text("To be received"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        currentIndex.value = 1;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentIndex.value == 1
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: const Text("To be picked up"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        currentIndex.value = 2;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentIndex.value == 2
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: const Text("Picked up"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "Search Deliverer’s name or package number",
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
              () {
                switch (currentIndex.value) {
                  case 0:
                    return const ToBeReceivedTabView();
                  case 1:
                    return ToBePickedUpTabView();
                  case 2:
                    return const PickedUpTabView();
                  default:
                    return const SizedBox();
                }
              }(),
            ],
          ),
        ),
      ),
    );
  }
}
