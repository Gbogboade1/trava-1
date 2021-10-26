import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/widgets/buttons/back_button.dart';

class FundWalletScreen extends StatefulWidget {
  static const String routeName = "/fund_wallet";
  const FundWalletScreen({Key? key}) : super(key: key);

  @override
  _FundWalletScreenState createState() => _FundWalletScreenState();
}

class _FundWalletScreenState extends State<FundWalletScreen> {
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
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  const Spacer(),
                  Text("Fund Wallet",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 21.5.h),
              Text("Select the card you want to fund your Wallet with",
                  style: Theme.of(context).textTheme.bodyText2),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 0.5,
                    color: const Color(0xffE0E0E0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 2),
                      blurRadius: 4.0,
                      color: const Color(0xff221A1A).withOpacity(0.04),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Selector(),
                    SizedBox(width: 24.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //card number
                        Text(
                          "**** **** **** 2378",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        //expiry date of card
                        Text(
                          "Expires: 03/21",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: const Color(0xff828282),
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Selector extends StatelessWidget {
  const Selector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.8,
          color: const Color(0xff828282),
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
