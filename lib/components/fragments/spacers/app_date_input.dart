import 'package:flutter/material.dart';
import 'package:trava/components/fragments/spacers/app_text_field.dart';

import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/utils/typedefs.dart';

class TravaDateInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final OnValidate<String>? validator;
  final DateTime? lastDate;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final bool isEnabled;
  final bool? formatDate;
  final bool _isDate;

  const TravaDateInput(
    this.controller, {
    Key? key,
    this.hintText = "Date",
    this.validator,
    this.isEnabled = true,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.formatDate = true,
  })  : _isDate = true,
        super(key: key);

  const TravaDateInput.time(
    this.controller, {
    Key? key,
    this.hintText = "Date",
    this.validator,
    this.isEnabled = true,
    this.formatDate = true,
  })  : _isDate = false,
        initialDate = null,
        firstDate = null,
        lastDate = null,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _TravaDateInputState();
}

class _TravaDateInputState extends State<TravaDateInput> {
  late TextEditingController _localCtrl;

  @override
  void initState() {
    super.initState();
    if (widget.controller.text.isNotEmpty) {
      _localCtrl = TextEditingController(text: widget.controller.text);
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
                  if (!widget._isDate) {
                    final date = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (date != null) {
                      widget.controller.text = date.format(context);
                      _localCtrl.text = date.format(context);
                    }
                  } else {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final date = await showDatePicker(
                      context: context,
                      initialDate: widget.initialDate ?? DateTime.now(),
                      firstDate: widget.firstDate ?? DateTime(1000),
                      lastDate: widget.lastDate ?? DateTime(3000),
                    );
                    if (date != null) {
                      widget.controller.text = TravaFormatter.formatDate(
                        date.toIso8601String(),
                        format: "dd-MMM-yyyy",
                      );
                      _localCtrl.text = TravaFormatter.formatDate(
                        date.toIso8601String(),
                        format: "dd-MMM-yyyy",
                      );
                    }
                  }
                }
              : null,
          child: TravaTextField(
            controller: _localCtrl,
            hintText: widget.hintText,
            validator: widget.validator,
            isEnabled: false,
            suffixIcon: Icon(!widget._isDate
                ? Icons.access_time
                : Icons.calendar_today_outlined),
          ),
        );
      },
    );
  }
}
