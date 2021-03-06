import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/hooks/profile_data_listening_widget.dart';
import 'package:trava/screens/home_screen/withdrawal_screen/components/add_new_bank.dart';
import 'package:trava/screens/home_screen/withdrawal_screen/components/bank_tile.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/widgets/custom_bottom_sheet.dart';

class BankAccountsBottomSheet extends StatefulWidget {
  const BankAccountsBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<BankAccountsBottomSheet> createState() =>
      _BankAccountsBottomSheetState();
}

class _BankAccountsBottomSheetState extends State<BankAccountsBottomSheet> {
  String? groupValue;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return ProfileSetUpDataListeningWidget(
      builder: (context, data) => CustomBottomSheet(
        title: "Linked bank account settings",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Here is a list of your saved cards. You can swipe to your left to delete any of the card(s)",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 24.h),
            ...List.generate(
              data?.user?.banks?.length ?? 0,
              (index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: UniqueKey(),
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: TravaColors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 13.5.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.delete,
                                color: TravaColors.white,
                              ),
                              SizedBox(height: 4.h),
                              Text("Delete",
                                  style: Theme.of(context).textTheme.headline4)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: BankTile(
                    selectorValue: "$index",
                    bank: data!.user!.banks![index],
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    },
                  ),
                  onDismissed: (direction) async {
                    if (groupValue == "$index") {
                      groupValue = null;
                    }
                    final result = await formSubmitDialog(
                        context: context,
                        prompt: "Removing bank, please wait...",
                        future: model
                            .deleteBank("${data.user!.banks![index].bankId}"));

                    if (result != null) {
                      model.status.value = Future.value(result);
                    }
                  },
                );
              },
            ),
            SizedBox(height: 43.h),
            const Center(
              child: AddNewBankButton(),
            ),
          ],
        ),
      ),
    );
  }
}
