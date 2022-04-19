import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/hooks/profile_data_listening_widget.dart';
import 'package:trava/models/https/payment/top_up.dart';
import 'package:trava/screens/home_screen/fund_wallet_screen/components/add_new_card_button.dart';
import 'package:trava/screens/home_screen/fund_wallet_screen/components/credit_card_tile.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/widgets/buttons/back_button.dart';
import 'package:trava/widgets/buttons/default_button.dart';

class FundWalletScreen extends HookWidget {
  static const String routeName = "/fund_wallet";

  FundWalletScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final groupValue = useState<String?>(null);
    final entered = useState<String>('');
    final model = context.watch<AuthState>();
    final fundWalletController = useTextEditingController();

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
                          Text("Fund Wallet",
                              style: Theme.of(context).textTheme.headline2),
                          const Spacer()
                        ],
                      ),
                      SizedBox(height: 21.5.h),
                      Text("Select the card you want to fund your Wallet with",
                          style: Theme.of(context).textTheme.bodyText2),
                      SizedBox(height: 24.h),
                      //until theendpoint is provided
                      Column(
                        children: [
                          ...List.generate(data?.user?.cards?.length ?? 0,
                              (index) {
                            return CreditCardTile(
                              selectorValue: "$index",
                              card: data!.user!.cards![index],
                              groupValue: groupValue.value,
                              onChanged: (value) {
                                groupValue.value = value!;
                              },
                            );
                          }),
                        ],
                      ),
                      groupValue.value != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 32.h),
                                Text(
                                  "Fund my Trava wallet with",
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
                                  onChanged: (s) {
                                    entered.value = s;
                                  },
                                  inputFormatters: [
                                    AmountFormatter(),
                                  ],
                                  controller: fundWalletController,
                                  keyboardType: TextInputType.number,
                                  decoration: kTextFieldDecoration.copyWith(
                                    hintText: "e.g ₦3,200",
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      SizedBox(height: 43.h),
                      const AddNewCardButton(),
                      const Spacer(),
                      groupValue != null
                          ? DefaultButton(
                              buttonLabel: "Fund my wallet",
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  final doResult = await formSubmitDialog(
                                      context: context,
                                      future: model.fundCard(
                                        TopUpWallet(
                                          cardId: data!
                                              .user!
                                              .cards![
                                                  int.parse(groupValue.value!)]
                                              .sId,
                                          amount: extractAmount(
                                                fundWalletController.text,
                                              )?.toInt() ??
                                              0,
                                        ),
                                      ),
                                      prompt:
                                          "Please wait while we process fund...");

                                  if (doResult != null) {
                                    showNotificationBottomSheet(
                                      context,
                                      title: "Wallet Successfully Funded!",
                                    );
                                  }
                                }
                              },
                              isActive: entered.value.isEmpty ? false : true,
                            )
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
