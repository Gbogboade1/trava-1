import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/home_screen/withdrawal_screen/components/add_new_bank.dart';
import 'package:trava/screens/home_screen/withdrawal_screen/components/bank_tile.dart';
import 'package:trava/utilities/constants.dart';
import 'package:trava/widgets/buttons/back_button.dart';
import 'package:trava/widgets/buttons/default_button.dart';

class WithdrawalScreen extends StatefulWidget {
  static const String routeName = "/withdrawal";
  const WithdrawalScreen({Key? key}) : super(key: key);

  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  String? groupValue;
  final TextEditingController withdrawalController = TextEditingController();

  @override
  void dispose() {
    withdrawalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: availableHeight,
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
                      Text("Withdrawal Money",
                          style: Theme.of(context).textTheme.headline2),
                      const Spacer()
                    ],
                  ),
                  SizedBox(height: 21.5.h),
                  Text(
                      "Select the bank account you want to withdraw money into",
                      style: Theme.of(context).textTheme.bodyText2),
                  SizedBox(height: 24.h),
                  ...List.generate(4, (index) {
                    return BankTile(
                      selectorValue: "$index",
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      },
                    );
                  }),
                  groupValue != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 32.h),
                            Text(
                              "How much do you want to withdraw?",
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: kBlack),
                            ),
                            SizedBox(height: 8.h),
                            TextFormField(
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: kGray1),
                              controller: withdrawalController,
                              keyboardType: TextInputType.number,
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: "e.g ₦3,200",
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  SizedBox(height: 43.h),
                  const AddNewBankButton(),
                  const Spacer(),
                  groupValue != null
                      ? DefaultButton(
                          buttonLabel: "Withdraw",
                          isActive:
                              withdrawalController.text.isEmpty ? false : true,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}