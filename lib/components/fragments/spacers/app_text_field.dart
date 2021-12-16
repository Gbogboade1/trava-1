import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trava/components/fragments/spacers/text_styles.dart';
import 'package:trava/models/podos/focus.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/typedefs.dart';
import 'package:trava/utils/extensions.dart';

import 'app_sized_box.dart';

class TravaTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isEnabled;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final bool? showLabel;
  final Function? onTap;
  final bool? obscureText;
  final String? hintText;
  final Widget? suffix;
  final bool? bold;
  final Widget? suffixIcon;
  final Widget? prefix;
  final TextAlignVertical? textAlignVertical;
  final OnValidate<String>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final Function(String)? onChanged;
  final TextStyle? style;
  final TextAlign? textAlign;
  final String? semanticsLabel;
  final bool? _expands;
  TextEditingController get ctrl {
    return controller ?? TextEditingController();
  }

  const TravaTextField({
    Key? key,
    this.semanticsLabel,
    this.textInputAction,
    this.textCapitalization,
    this.controller,
    this.textAlignVertical,
    this.isEnabled = true,
    this.inputFormatters,
    this.onTap,
    this.bold = false,
    this.showLabel = true,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.style,
  })  : this._expands = false,
        super(key: key);

  const TravaTextField.expand({
    Key? key,
    this.semanticsLabel,
    this.textInputAction,
    this.textCapitalization,
    this.controller,
    this.textAlignVertical,
    this.isEnabled,
    this.inputFormatters,
    this.bold = false,
    this.onTap,
    this.showLabel = true,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.style,
  })  : this._expands = true,
        super(key: key);

  @override
  _TravaTextFieldState createState() => _TravaTextFieldState();
}

class _TravaTextFieldState extends State<TravaTextField>
    with WidgetsBindingObserver {
  final _inputFocus = FocusNode();
  final ValueNotifier<FocusState> _hasFocus = ValueNotifier(FocusState());

  @override
  void initState() {
    super.initState();
    _inputFocus.addListener(
      () {
        _hasFocus.value = FocusState(
          hasText:
              widget.ctrl != null && (widget.ctrl?.text?.isNotEmpty ?? false),
          isFocused: _inputFocus.hasFocus,
        );
      },
    );
  }

  InputDecoration get decoration {
    return InputDecoration(
      filled: false,
      fillColor: TravaColors.transparent,
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: TravaColors.transparent,
          width: 0,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: TravaColors.transparent,
          width: 0,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: TravaColors.transparent,
          width: 0,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: TravaColors.transparent,
          width: 0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: TravaColors.transparent,
          width: 0,
        ),
      ),
      labelText: widget.hintText,
      labelStyle: TravaTextStyle.bold.copyWith(
        color: TravaColors.black.withOpacity(.8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    log("${widget.bold}");
    return IgnorePointer(
      ignoring: !(widget.isEnabled ?? true),
      child: Semantics(
        label: widget.semanticsLabel ?? "Input Field",
        child: ValueListenableBuilder(
          valueListenable: _hasFocus,
          builder: (context, FocusState value, child) {
            return InkWell(
              onTap: () => FocusScope.of(context).requestFocus(_inputFocus),
              child: Container(
                padding:
                    scaler.insets.symmetric(vertical: value.hasError ? 0 : .5),
                margin: scaler.insets.zero,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: value.hasError
                        ? TravaColors.red
                        : value.isFocused
                            ? TravaColors.blueBorder
                            : TravaColors.grayBorder,
                  ),
                  borderRadius: BorderRadius.circular(
                    scaler.fontSizer.sp(15),
                  ),
                ),
                child: child,
              ),
            );
          },
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widget.prefix != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 1.0),
                        child: Container(
                            width: scaler.sizer.setWidth(6),
                            child: widget.prefix),
                      )
                    : TravaSizedBox(),
                widget.prefix != null ? VerticalDivider() : TravaSizedBox(),
                Expanded(
                  child: TextFormField(
                    showCursor: true,
                    textAlign: widget.textAlign!,
                    textAlignVertical: widget.textAlignVertical,
                    focusNode: _inputFocus,
                    onTap: () {
                      FocusScope.of(context).requestFocus(_inputFocus);
                    },
                    textInputAction:
                        widget.textInputAction ?? TextInputAction.done,
                    textCapitalization:
                        widget.textCapitalization ?? TextCapitalization.none,
                    style: widget.style ??
                        TravaTextStyle.bold
                            .copyWith(fontSize: scaler.fontSizer.sp(40)),
                    maxLength: widget.maxLength,
                    controller: widget.ctrl,
                    enabled: true,
                    obscureText: widget.obscureText!,
                    keyboardType: widget.keyboardType ?? TextInputType.text,
                    inputFormatters: widget.inputFormatters,
                    maxLines: widget.maxLines ?? 1,
                    cursorColor: TravaColors.black,
                    onChanged: widget.onChanged,
                    decoration: decoration.copyWith(
                      alignLabelWithHint: widget._expands,
                      labelStyle: widget.bold!
                          ? null
                          : TravaTextStyle.medium.copyWith(
                              fontSize: scaler.fontSizer.sp(40),
                            ),
                      suffixIcon: widget.suffixIcon != null
                          ? widget.suffixIcon
                          : Offstage(),
                      // prefix: widget.prefix,
                      counter: null,
                      counterStyle: TravaTextStyle.bold,
                      contentPadding: scaler.insets.symmetric(
                        horizontal: 3,
                        // vertical: 1.5,
                      ),
                    ),
                    validator: (String? text) {
                      if (widget.validator != null) {
                        final error = widget.validator!(text ?? '');
                        _hasFocus.value = FocusState(
                          hasError: error != null,
                          hasText: _hasFocus.value.hasText,
                          isFocused: _hasFocus.value.isFocused,
                        );
                        return error;
                      }
                      _hasFocus.value = FocusState(
                        hasError: false,
                        hasText: _hasFocus.value.hasText,
                        isFocused: _hasFocus.value.isFocused,
                      );
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
