import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/validators.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/trava_dropdown.dart';

class AddNewCardBottomSheet extends StatefulWidget {
  const AddNewCardBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNewCardBottomSheet> createState() => _AddNewCardBottomSheetState();
}

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

class _AddNewCardBottomSheetState extends State<AddNewCardBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 584.h,
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
                        Text(
                          "Bank Name",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(height: 8.h),
                        TravaDropdown(
                          TextEditingController(),
                          validator: TravaValidators.required,
                          items: banking
                              .map((e) => SelectionData(e['Name']!, e['code']))
                              .toList(),
                          hintText: "Choose your bank",
                        ),
                        SizedBox(height: 16.h),
                        //Card number texfield
                        Text(
                          "Card Number",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: "Your card number",
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            //Expiry date TextFormField
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Expiry Date",
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    SizedBox(height: 8.h),
                                    TextFormField(
                                      decoration: kTextFieldDecoration.copyWith(
                                        hintText: "Your card’s expiry date",
                                      ),
                                    ),
                                  ]),
                            ),
                            SizedBox(width: 16.w),
                            //CVV textformfield
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CVV",
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    SizedBox(height: 8.h),
                                    TextFormField(
                                      decoration: kTextFieldDecoration.copyWith(
                                        hintText: "CVV",
                                      ),
                                    ),
                                  ]),
                            )
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Account Number",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: "",
                          ),
                        ),
                        const Spacer(),
                        const DefaultButton(
                          isActive: true,
                          buttonLabel: "Add card",
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
    );
  }
}
