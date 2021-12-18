import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/validators.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/trava_dropdown.dart';

class AddNewBankBottomSheet extends StatefulWidget {
  const AddNewBankBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNewBankBottomSheet> createState() => _AddNewBankBottomSheetState();
}

class AddNewBankButton extends StatelessWidget {
  const AddNewBankButton({
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
          builder: (context) => const AddNewBankBottomSheet(),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add_circle_outline, size: 16.w, color: kGray2),
          SizedBox(width: 7.w),
          Text(
            "Add new bank account",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: kGray2,
                ),
          ),
        ],
      ),
    );
  }
}

class _AddNewBankBottomSheetState extends State<AddNewBankBottomSheet> {
  final ValueNotifier<SelectionData?> _chosenValue = ValueNotifier(null);
  final TextEditingController bankName = TextEditingController();
  final TextEditingController accountName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController accountNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 511.h,
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
                    padding: EdgeInsets.fromLTRB(24.w, 15.h, 24.w, 25.h),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Add new account",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        //Bank dropdown  field
                        Text(
                          "Bank Name",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(height: 8.h),
                        TravaDropdown(
                          bankName,
                          validator: TravaValidators.required,
                          items: banking
                              .map(
                                (e) => SelectionData(
                                  e['Name']!,
                                  e['Code'],
                                ),
                              )
                              .toList(),
                          hintText: "Choose your bank",
                        ),
                        SizedBox(height: 16.h),
                        //Card number texfield
                        Text(
                          "Account Number",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          controller: accountNumber,
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: "Your account number",
                          ),
                        ),
                        SizedBox(height: 16.h),

                        Text(
                          "Account Name",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          controller: accountName,
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: "",
                          ),
                        ),
                        const Spacer(),
                        DefaultButton(
                            isActive: true,
                            buttonLabel: "Add account",
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                final request = await formSubmitDialog(
                                  context: context,
                                  future: model.addBankAccount(
                                    bankName.text,
                                    accountNumber.text,
                                    accountName.text,
                                  ),
                                  prompt: "Adding banking details",
                                );
                                if (request != null) {
                                  showNotificationBottomSheet(
                                    context,
                                    title: "Account Added Successfully!",
                                  );
                                }
                              }
                            })
                      ],
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
}
