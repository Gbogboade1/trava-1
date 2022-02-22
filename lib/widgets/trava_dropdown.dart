import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/components/fragments/spacers/app_selection_full_sheet.dart';

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
  List<SelectionData> get lgas {
    if (widget.state == null || (widget.state?.isEmpty ?? true)) return [];
    final json = county.where(
      (it) => '${it["state"]}'.toLowerCase() == widget.state!.toLowerCase(),
    );
    log("here=  ${json}");
    return json
        .map((it) => SelectionData(it['city'].toString().toLowerCase(),
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

class TravaDropdown extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final OnValidate<String>? validator;
  final isHub;
  final List<SelectionData>? items;
  final OnChanged<SelectionData>? onChanged;
  final bool pop;
  final bool isEnabled;

  const TravaDropdown(
    this.controller, {
    Key? key,
    this.hintText = "Dropdown",
    this.validator,
    this.items,
    this.isHub = false,
    this.isEnabled = true,
    this.onChanged,
    this.pop = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TravaDropdownInputState();
}

class TravaDropdownInputState extends State<TravaDropdown> {
  late TextEditingController _localCtrl;

  @override
  void initState() {
    super.initState();

    _populateCtrl();
  }

  void _populateCtrl() {
    if (widget.controller.text.isNotEmpty) {
      widget.items!
          .forEach((e) => log("message ${widget.controller.text} ${e.title}"));
      final selection = widget.items?.firstWhere((it) {
        log("it--- ${it.title.toLowerCase()}");
        log("it bool --- ${widget.controller.text.toLowerCase()} ${it.title.toLowerCase() == widget.controller.text.toLowerCase()}");
        return (it.title.toLowerCase() == widget.controller.text.toLowerCase());
      }, orElse: () => SelectionData('', ''));
      // log("locla -- ${selection?.title}");
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
                  if (widget.isHub) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullSelectionBottomSheet(
                          title: widget.hintText,
                          onSelect: (SelectionData s) {
                            widget.controller.text = s.title ?? "";
                            _localCtrl.text = s.title ?? "";
                            if (widget.onChanged != null &&
                                widget.items != null) {
                              widget.onChanged!(s);
                            }
                          },
                          items: widget.items ?? [],
                        ),
                        fullscreenDialog: true,
                      ),
                    );
                    return;
                  }
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
