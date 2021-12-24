import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:trava/components/fragments/spacers/app_text_field.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/utils/county_list.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/typedefs.dart';

class TownDropDownInput extends StatefulWidget {
  final String? state;
  final OnValidate<String>? validator;
  final TextEditingController? controller;

  const TownDropDownInput({
    Key? key,
    this.state,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TownDropDownInputState();
}

class TownDropDownInputState extends State<TownDropDownInput> {
  List<SelectionData<String>> get lgas {
    if (widget.state == null || (widget.state?.isEmpty ?? true)) return [];
    final json = county.where(
      (it) => '${it["state"]}'.toLowerCase() == widget.state!.toLowerCase(),
    );
    log("here=  ${json.length}");
    return json
        .map((it) => SelectionData<String>(it['city'].toString().toLowerCase(),
            it['city'].toString().toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // if (lgas.isEmpty) return const Offstage();

    return TravaDropdown(
      widget.controller!,
      validator: widget.validator,
      hintText: "e.g Ibadan",
      items: lgas,
    );
  }

  @override
  void didUpdateWidget(TownDropDownInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state!.trim() != oldWidget.state!.trim()) {
      widget.controller!.clear();
    }
  }
}

class TravaDropdown<T> extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final OnValidate<String>? validator;
  final List<SelectionData<T>>? items;
  final OnChanged<SelectionData>? onChanged;
  final bool pop;
  final bool isEnabled;

  const TravaDropdown(
    this.controller, {
    Key? key,
    this.hintText = "Dropdown",
    this.validator,
    this.items,
    this.isEnabled = true,
    this.onChanged,
    this.pop = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TravaDropdownInputState<T>();
}

class TravaDropdownInputState<T> extends State<TravaDropdown> {
  late TextEditingController _localCtrl;

  @override
  void initState() {
    super.initState();

    _populateCtrl();
  }

  void _populateCtrl() {
    if (widget.controller.text.isNotEmpty) {
      final SelectionData? selection = widget.items?.firstWhere(
        (it) => (it.title == widget.controller.text),
      );

      _localCtrl = TextEditingController(text: selection?.title ?? '');
    } else {
      _localCtrl = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: widget.isEnabled
              ? () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  showSelectionSheet(
                    context,
                    title: widget.hintText,
                    data: widget.items,
                    onSelect: (data) {
                      widget.controller.text = data.selectedData;
                      _localCtrl.text = data.title;
                      if (widget.onChanged != null) {
                        if (widget.pop) Navigator.pop(context);
                        widget.onChanged!(data);
                      }
                    },
                  );
                }
              : null,
          child: TravaTextField(
            isEnabled: false,
            // showLabel: false,
            controller: _localCtrl,
            hintText: widget.hintText,
            style: TextStyle(
                color: const Color(0xff828282),
                fontSize: 18.sp,
                fontWeight: FontWeight.w300),
            validator: widget.validator,
            suffixIcon: const Icon(Icons.keyboard_arrow_down),
          ),
        );
      },
    );
  }

  @override
  void didUpdateWidget(TravaDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller.text.trim().isEmpty) {
      _localCtrl.clear();
    }
  }
}
