import 'package:flutter/material.dart';
import 'package:trava/components/fragments/spacers/app_sized_box.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/typedefs.dart';
import 'package:trava/utils/extensions.dart';

class SelectionBottomSheet<T> extends StatelessWidget {
  final String? title;
  final OnChanged<T>? onSelect;
  final List<SelectionData>? items;

  const SelectionBottomSheet({Key? key, 
    required this.title,
    required this.onSelect,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return DraggableScrollableSheet(
      initialChildSize: .43,
      maxChildSize: .8,
      minChildSize: .1,
      builder: (context, _) {
        return Builder(
          builder: (context) {
            return Container(
              padding: scaler.insets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: TravaColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    scaler.fontSizer.sp(30),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TravaSizedBox(height: 3),
                  Text(
                    title ?? '',
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      controller: _,
                      itemBuilder: (_, idx) {
                        final item = items![idx];
                        return ListTile(
                          onTap: () {
                            if (onSelect != null) onSelect!(item as T);
                            Navigator.of(context).pop();
                          },
                          dense: true,
                          contentPadding: scaler.insets.zero,
                          title: Text(
                            item.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) {
                        return Divider(
                          color: TravaColors.divider,
                          height: scaler.sizer.setHeight(.5),
                        );
                      },
                      itemCount: items?.length ?? 0,
                      padding: scaler.insets.symmetric(vertical: 1),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
