import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:trava/components/fragments/spacers/app_sized_box.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/widgets/buttons/default_button.dart';

import 'app_loader.dart';

enum MessageType {
  Error,
  Warning,
  Success,
  Info,
  Pending,
}

class DialogMessage extends StatelessWidget {
  final dynamic message;
  final MessageType messageType;
  final String? route;
  final TextAlign textAlign;
  final bool _isConfirm;
  final bool _isAction;

  DialogMessage({
    required this.message,
    this.messageType = MessageType.Info,
    this.textAlign = TextAlign.center,
    this.route,
  })  : _isConfirm = false,
        _isAction = false;

  DialogMessage.confirm({
    required this.message,
    this.messageType = MessageType.Info,
    this.textAlign = TextAlign.center,
    required this.route,
  })  : _isConfirm = true,
        _isAction = false;
  DialogMessage.action({
    required this.message,
    this.messageType = MessageType.Warning,
    this.textAlign = TextAlign.center,
    required this.route,
  })  : _isAction = true,
        _isConfirm = false;
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
    switch (messageType) {
      case MessageType.Error:
        return Icon(
          Icons.error_outline,
          size: 30,
          color: TravaColors.red,
        );
        break;
      case MessageType.Success:
        return Icon(
          Icons.sentiment_satisfied,
          size: 30,
          color: TravaColors.green,
        );
        break;
      case MessageType.Warning:
        return Icon(
          Icons.warning,
          size: 30,
          color: TravaColors.red.withGreen(100),
        );
        break;
      case MessageType.Pending:
        return const Apploader();
        break;
      default:
        return Icon(
          Icons.notifications,
          size: 30,
          color: TravaColors.black,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: _isConfirm || _isAction
          ? CrossAxisAlignment.stretch
          : CrossAxisAlignment.center,
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
        if (_isConfirm || _isAction) const TravaSizedBox(height: 3),
        if (_isConfirm)
          DefaultButton(
            buttonLabel: "Proceed",
            isActive: true,
            onTap: () {
              Navigator.of(context).pop(true);
            },
          ),
        if (_isAction)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultButton(
                buttonLabel: "Proceed",
                isActive: true,
                // color: TravaColors.red,
                onTap: () {
                  Navigator.of(context).pop(true);
                },
              ),
              DefaultButton(
                buttonLabel: "Cancel",
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
