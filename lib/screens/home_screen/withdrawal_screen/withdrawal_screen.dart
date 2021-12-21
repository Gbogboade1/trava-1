import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/hooks/profile_data_listening_widget.dart';
import 'package:trava/screens/home_screen/withdrawal_screen/components/add_new_bank.dart';
import 'package:trava/screens/home_screen/withdrawal_screen/components/bank_tile.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/validators.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    withdrawalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    final availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: SafeArea(
        child: ProfileSetUpDataListeningWidget(
          builder: (context, data) => SingleChildScrollView(
            child: SizedBox(
              height: availableHeight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 27.h,
                ),
                child: Form(
                  key: formKey,
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
                      ...List.generate(data?.user?.banks?.length ?? 0, (index) {
                        return BankTile(
                          selectorValue: "$index",
                          bank: data!.user!.banks![index],
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
                                  validator: (s) =>
                                      TravaValidators.amountValidator(
                                    s,
                                    minAmount: 500,
                                    maxAmount: data!.user!.wallet,
                                  ),
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
                              isActive: true,
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  final withdraw = await formSubmitDialog(
                                    context: context,
                                    prompt: "Sending withdrawal request",
                                    future: model.withdraw(
                                      data!.user!.banks![int.parse(groupValue!)]
                                          .bankId!,
                                      int.parse(withdrawalController.text),
                                    ),
                                  );
                                  if (withdraw != null) {
                                    showNotificationBottomSheet(context,
                                        message: "Withdrawal  Successful",
                                        title: "",);
                                  }
                                }
                              })
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
