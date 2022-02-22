import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/models/https/users/profile_data.dart';
import 'package:trava/widgets/buttons/selector.dart';

class CreditCardTile extends StatelessWidget {
  const CreditCardTile({
    Key? key,
    required this.selectorValue,
    required this.card,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);
  final String selectorValue;
  final Cards card;
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
                  "**** **** **** ${card.last4}",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 5.h),
                //expiry date of card
                Text(
                  "Expires: ${card.expmonth}/${card.expyear}",
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
