import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:flutterwave_standard/view/flutterwave_style.dart';
import 'package:provider/provider.dart';
import 'package:trava/models/https/payment/top_up.dart';
import 'package:trava/models/https/payment/top_up_wallet_response.dart' as top;

import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/validators.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/trava_dropdown.dart';

class AddNewCardButton extends StatelessWidget {
  const AddNewCardButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => const AddNewCardBottomSheet(),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add_circle_outline, size: 16.w, color: kGray2),
          SizedBox(width: 7.w),
          Text(
            "Add new card",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: kGray2,
                ),
          ),
        ],
      ),
    );
  }
}

class AddNewCardBottomSheet extends StatefulWidget {
  const AddNewCardBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNewCardBottomSheet> createState() => _AddNewCardBottomSheetState();
}

class _AddNewCardBottomSheetState extends State<AddNewCardBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 300.h,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    //width: 32.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: 20.h,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(24.w, 15.h, 24.w, 18.h),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Add new card",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          //Bank dropdown  field
                          // Text(
                          //   "Bank Name",
                          //   style: Theme.of(context).textTheme.headline3,
                          // ),
                          // SizedBox(height: 8.h),
                          // TravaDropdown(
                          //   TextEditingController(),
                          //   validator: TravaValidators.required,
                          //   items: banking
                          //       .map((e) => SelectionData(e['Name']!, e['code']))
                          //       .toList(),
                          //   hintText: "Choose your bank",
                          // ),
                          // SizedBox(height: 16.h),
                          // //Card number texfield
                          // Text(
                          //   "Card Number",
                          //   style: Theme.of(context).textTheme.headline3,
                          // ),
                          // SizedBox(height: 8.h),
                          // TextFormField(
                          //   decoration: kTextFieldDecoration.copyWith(
                          //     hintText: "Your card number",
                          //   ),
                          // ),
                          // SizedBox(height: 16.h),
                          // Row(
                          //   children: [
                          //     //Expiry date TextFormField
                          //     Expanded(
                          //       child: Column(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               "Expiry Date",
                          //               style:
                          //                   Theme.of(context).textTheme.headline3,
                          //             ),
                          //             SizedBox(height: 8.h),
                          //             TextFormField(
                          //               decoration: kTextFieldDecoration.copyWith(
                          //                 hintText: "Your card’s expiry date",
                          //               ),
                          //             ),
                          //           ]),
                          //     ),
                          //     SizedBox(width: 16.w),
                          //     //CVV textformfield
                          //     Expanded(
                          //       child: Column(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               "CVV",
                          //               style:
                          //                   Theme.of(context).textTheme.headline3,
                          //             ),
                          //             SizedBox(height: 8.h),
                          //             TextFormField(
                          //               decoration: kTextFieldDecoration.copyWith(
                          //                 hintText: "CVV",
                          //               ),
                          //             ),
                          //           ]),
                          //     )
                          //   ],
                          // ),
                          // SizedBox(height: 8.h),
                          Text(
                            "Amount",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            validator: (s) => TravaValidators.amountValidator(
                              s,
                              minAmount: 100,
                            ),
                            inputFormatters: [
                              AmountFormatter(),
                            ],
                            keyboardType: TextInputType.number,
                            controller: amount,
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: "Enter Amount",
                            ),
                          ),
                          const Spacer(),
                          DefaultButton(
                            isActive: true,
                            buttonLabel: "Add card",
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                final doResult = await formSubmitDialog(
                                    context: context,
                                    future: model.fundCard(
                                      TopUpWallet(
                                        cardId: null,
                                        amount: extractAmount(
                                              amount.text,
                                            )?.toInt() ??
                                            0,
                                      ),
                                    ),
                                    prompt:
                                        "Please wait while we process fund...");

                                if (doResult != null) {
                                  await _handlePaymentInitialization(
                                      context, doResult.data!.config!);
                                }
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _handlePaymentInitialization(BuildContext context, top.Config config) async {
    final style = FlutterwaveStyle(
        appBarText: "Trava Wallet",
        buttonColor: const Color(0xffd0ebff),
        appBarIcon: const Icon(Icons.message, color: Color(0xffd0ebff)),
        buttonTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        appBarColor: const Color(0xffd0ebff),
        dialogCancelTextStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: 18,
        ),
        dialogContinueTextStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ));
    final Customer customer = Customer(
      name: config.meta!.fullname!,
      phoneNumber: "1234566677777",
      email: config.meta!.email!,
    );

    final Flutterwave flutterwave = Flutterwave(
      context: context,
      style: style,
      publicKey:
          config.publicKey ?? "FLWPUBK-49bc5365ed9e6995b66697431a902ff4-X",
      currency: config.currency!,
      txRef: config.txRef!.toString(),
      paymentPlanId: config.meta!.paymentId,
      meta: config.meta!.toJson(),
      amount: config.amount!.toString(),
      customer: customer,
      paymentOptions: "card",
      customization: Customization(
        title: "Trava add card",
        description: config.customizations!.title!,
        logo: config.customizations!.logo,
      ),
      isTestMode: !true,
    );
    final ChargeResponse response = await flutterwave.charge();
    if (response != null) {
      print(response.toJson());
      if (response.success ?? false) {
        showNotificationBottomSheet(
          context,
          title: "Card Added Successfully!",
        ); //  Call the verify transaction endpoint with the transactionID returned in `response.transactionId` to verify transaction before offering value to customer
      } else {
        // Transaction not successful
        showNotificationBottomSheet(
          context,
          title: "${response.status}",
        );
      }
    } else {
      // User cancelled
      showNotificationBottomSheet(
        context,
        title: "Transaction cancelled!",
      );
    }
  }

  // beginPayment(BuildContext context, Config config) async {
  //   final Flutterwave flutterwave = Flutterwave.forUIPayment(
  //       context: context,
  //       encryptionKey: "42c403869fddde7d5998f73a",
  //       publicKey:
  //           config.publicKey ?? "FLWPUBK-49bc5365ed9e6995b66697431a902ff4-X",
  //       currency: config.currency!,
  //       amount: config.amount!.toString(),
  //       email: config.meta!.email!,
  //       fullName: config.meta!.fullname!,
  //       txRef: config.txRef!.toString(),
  //       isDebugMode: true,
  //       phoneNumber: "+234*********",
  //       // acceptBankTransfer: true,
  //       acceptCardPayment: true,
  //       acceptUSSDPayment: false,
  //       acceptAccountPayment: false,
  //       acceptFrancophoneMobileMoney: false,
  //       acceptGhanaPayment: false,
  //       acceptMpesaPayment: false,
  //       acceptRwandaMoneyPayment: true,
  //       acceptUgandaPayment: false,
  //       acceptZambiaPayment: false);

  //   try {
  //     final ChargeResponse? response =
  //         await flutterwave.initializeForUiPayments();
  //     if (response == null) {
  //       showNotificationBottomSheet(
  //         context,
  //         title: "Transaction cancelled!",
  //       );
  //     } else {
  //       final isSuccessful = checkPaymentIsSuccessful(
  //         response,
  //         config,
  //       );
  //       if (isSuccessful) {
  //         // provide value to customer
  //         showNotificationBottomSheet(
  //           context,
  //           title: "Card Added Successfully!",
  //         );
  //       } else {
  //         // check message
  //         showNotificationBottomSheet(
  //           context,
  //           title: "${response.message}",
  //         );
  //       }
  //     }
  //   } catch (error, stacktrace) {
  //     // handleError(error);
  //   }
  // }

  // bool checkPaymentIsSuccessful(ChargeResponse response, Config config) {
  //   return response.data?.status == FlutterwaveConstants.SUCCESSFUL &&
  //       response.data?.currency == config.currency &&
  //       response.data?.amount == config.amount.toString() &&
  //       response.data?.txRef == config.txRef.toString();
  // }
}
