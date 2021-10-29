import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/utilities/constants.dart';
import 'package:trava/widgets/buttons/default_button.dart';

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

class TravaDropdown extends StatelessWidget {
  const TravaDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);
  final String? value;
  final ValueChanged<String?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffefefef).withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: DropdownButton<String>(
        focusColor: Colors.white,
        isExpanded: true,
        value: value,
        underline: const SizedBox(),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: kGray4,
        ),
        //elevation: 5,
        style: const TextStyle(color: Colors.white),

        items: <String>[
          'A',
          'B',
          'C',
          'D',
          'E',
          'F',
          'G',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        hint: Text(
          "Choose your bank",
          style: TextStyle(
              color: kGray3, fontSize: 12.sp, fontWeight: FontWeight.w300),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class AddNewBankBottomSheet extends StatefulWidget {
  const AddNewBankBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNewBankBottomSheet> createState() => _AddNewBankBottomSheetState();
}

class _AddNewBankBottomSheetState extends State<AddNewBankBottomSheet> {
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 511.h,
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
                        value: _chosenValue,
                        onChanged: (String? value) {
                          setState(() {
                            _chosenValue = value;
                          });
                        },
                      ),
                      SizedBox(height: 16.h),
                      //Card number texfield
                      Text(
                        "Account Number",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
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
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "",
                        ),
                      ),
                      const Spacer(),
                      const DefaultButton(
                        isActive: true,
                        buttonLabel: "Add account",
                      )
                    ],
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
