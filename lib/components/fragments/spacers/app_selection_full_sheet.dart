import 'package:trava/components/fragments/spacers/app_sized_box.dart';
import 'package:trava/components/fragments/spacers/app_text_field.dart';
import 'package:trava/components/fragments/spacers/text_styles.dart';
import 'package:trava/style/colors.dart';

import 'package:trava/utils/extensions.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/src/provider.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/extensions.dart';
import 'package:trava/utils/typedefs.dart';

class FullSelectionBottomSheet<T> extends StatefulWidget {
  final OnChanged<T> onSelect;
  final String title;
  final List<SelectionData> items;

  FullSelectionBottomSheet({
    required this.title,
    required this.onSelect,
    required this.items,
  });

  @override
  State<FullSelectionBottomSheet<T>> createState() =>
      _FullSelectionBottomSheetState<T>();
}

class _FullSelectionBottomSheetState<T>
    extends State<FullSelectionBottomSheet<T>> {
  late List<SelectionData> items;
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    items = widget.items;
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    final acctModel = context.watch<AuthState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // gradient: getTheme(
        //   theme,
        //   mode,
        // ),
        title: Text(
          widget.title,
          style: TravaTextStyle.bold.copyWith(
            fontSize: 16.0,
          ),
        ),
      ),
      body: Container(
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
            Expanded(
              child: ListView.separated(
                // controller: _,
                itemBuilder: (_, idx) {
                  final item = items[idx];
                  return ListTile(
                    onTap: () {
                      widget.onSelect(item as T);
                      Navigator.of(context).pop();
                    },
                    // dense: true,
                    contentPadding: scaler.insets.zero, minVerticalPadding: 4,
                    title: Padding(
                      padding: scaler.insets.only(
                        bottom: 1.0,
                      ),
                      child: Text(
                        item.title,
                        style: TravaTextStyle.medium,
                      ),
                    ),
                    subtitle: Text(
                      item.description ?? "",
                      style: TravaTextStyle.medium,
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider(
                    color: TravaColors.divider,
                    height: scaler.sizer.setHeight(.5),
                  );
                },
                itemCount: items.length,
                padding: scaler.insets.symmetric(vertical: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
