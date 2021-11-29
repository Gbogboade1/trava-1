import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trava/components/fragments/spacers/app_sized_box.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/widgets/buttons/default_button.dart';

enum MessageType {
  Error,
  Warning,
  Success,
  Info,
  Pending,
}

class ComfirmAction extends StatelessWidget {
  final dynamic message;
  final MessageType messageType;
  final TextAlign textAlign;
  final bool _isConfirm;

  final String route;

  ComfirmAction.confirm({
    required this.message,
    this.messageType = MessageType.Info,
    required this.route,
    this.textAlign = TextAlign.center,
  }) : _isConfirm = true;

  String _parsedMessage() {
    if (message is String) {
      return message;
    } else if (message is Map || message is List) {
      final List<String> messageArr = message is Map
          ? message.values.map((it) => "$it").toList()
          : message.map((it) => "$it").toList();
      return messageArr.join("; ");
    } else {
      return "";
    }
  }

  Widget _messageIcon() {
    return Icon(
      Icons.warning,
      size: 30,
      color: TravaColors.red.withGreen(100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          _isConfirm ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (!_isConfirm) _messageIcon(),
        const TravaSizedBox(height: 1),
        Flexible(
          child: Text(
            _parsedMessage(),
            textAlign: TextAlign.center,
          ),
        ),
        if (_isConfirm) const TravaSizedBox(height: 3),
        if (_isConfirm)
          Row(
            children: [
              DefaultButton(
                buttonLabel: "Proceed",
                isActive: true,
                onTap: () {
                  // Navigator.of(context).pop(true);
                  // if (route == TravaRoutes.login) {

                    Navigator.of(context).pushNamedAndRemoveUntil(
                      route,
                      (route) => false,
                    );
                    return;
                  // }
                },
              ),
              DefaultButton(
                buttonLabel:"Cancel",
                isActive: true,
                onTap: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          )
      ],
    );
  }
}
