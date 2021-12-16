import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:trava/components/fragments/spacers/app_text_field.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/utils/county_list.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/typedefs.dart';

// class TravaDropdown extends StatelessWidget {
//   final ValueNotifier<SelectionData?> value;
//   final ValueChanged<SelectionData?> onChanged;
//   final String hint;
//   final List<SelectionData> items;
//   const TravaDropdown({
//     Key? key,
//     required this.value,
//     required this.items,
//     required this.onChanged,
//     required this.hint,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xffefefef).withOpacity(0.5),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: DropdownButton<SelectionData>(
//         focusColor: Colors.white,
//         isExpanded: true,
//         value: value.value,
//         underline: const SizedBox(),
//         icon: const Icon(
//           Icons.keyboard_arrow_down_rounded,
//           color: kGray4,
//         ),
//         //elevation: 5,
//         style: const TextStyle(color: Colors.white),
//         items: items.map<DropdownMenuItem<SelectionData>>((SelectionData data) {
//           return DropdownMenuItem<SelectionData>(
//             value: data,
//             child: Text(
//               data.title,
//               style: const TextStyle(color: Colors.black),
//             ),
//           );
//         }).toList(),
//         hint: Text(
//           hint,
//           style: TextStyle(
//               color: kGray3, fontSize: 12.sp, fontWeight: FontWeight.w300),
//         ),
//         onChanged: onChanged,
//       ),
//     );
//   }
// }

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

    return json
        .map((it) => SelectionData<String>(it['city'].toString().toLowerCase(),
            it['city'].toString().toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (lgas.isEmpty) return const Offstage();

    return TravaDropdown(
      widget.controller!,
      validator: widget.validator,
      hintText: "LGA",
      items: lgas,
    );
  }
}

class TravaDropdown<T> extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final OnValidate<String>? validator;
  final List<SelectionData<T>>? items;
  final OnChanged<int>? onChanged;
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
                      widget.controller.text = data.title;
                      _localCtrl.text = data.title;
                      if (widget.onChanged != null) {
                        if (widget.pop) Navigator.pop(context);
                        widget.onChanged!(widget.items!.indexOf(data));
                      }
                    },
                  );
                }
              : null,
          child: TravaTextField(
            isEnabled: false,
            controller: _localCtrl,
            hintText: widget.hintText,
            style: TextStyle(
                color: const Color(0xff828282),
                fontSize: 12.sp,
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
