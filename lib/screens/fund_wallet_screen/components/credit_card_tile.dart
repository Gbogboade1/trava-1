
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCardTile extends StatelessWidget {
  const CreditCardTile({
    Key? key,
    required this.selectorValue,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);
  final String selectorValue;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  bool get isSelected => selectorValue == groupValue;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(selectorValue),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.5.h),
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
            width: isSelected ? 1.0 : 0.5,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : const Color(0xffE0E0E0),
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
            Selector(
              value: selectorValue,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
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
                SizedBox(height: 5.h),
                //expiry date of card
                Text(
                  "Expires: 03/21",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: const Color(0xff828282),
                      ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class Selector extends StatelessWidget {
  const Selector({
    Key? key,
    this.value,
    this.groupValue,
    this.onChanged,
  }) : super(key: key);

  final String? value;
  final String? groupValue;
  final ValueChanged<String?>? onChanged;

  bool get isSelected => value == groupValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: isSelected ? 1.0 : 0.8,
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : const Color(0xff828282),
        ),
        shape: BoxShape.circle,
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12.w,
                height: 12.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
