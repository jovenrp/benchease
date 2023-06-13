import 'dart:developer';

import 'package:benchease/core/domain/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ATTextfield extends StatefulWidget {
  const ATTextfield({
    Key? key,
    this.hintText,
    this.isScanner = false,
    this.isNumbersOnly = false,
    this.isSuffixIcon = false,
    this.isPrefixIcon = false,
    this.onFieldSubmitted,
    this.onPressed,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
    this.textAlign = TextAlign.left,
    this.isPasswordField = false,
    this.textEditingController,
    this.textInputType,
    this.focusNode,
    this.borderRadius,
    this.borderColor,
  }) : super(key: key);

  final String? hintText;
  final bool? isScanner;
  final bool isPasswordField;
  final bool isSuffixIcon;
  final bool isPrefixIcon;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Function(String?)? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final Function()? onPressed;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool isNumbersOnly;
  final double? borderRadius;
  final Color? borderColor;

  @override
  _ATTextfield createState() => _ATTextfield();
}

class _ATTextfield extends State<ATTextfield> {
  bool _passwordNotVisible = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextFormField(
        controller: widget.textEditingController,
        focusNode: widget.focusNode,
        key: widget.key,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        textAlign: widget.textAlign ?? TextAlign.center,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType ?? TextInputType.text,
        obscureText: widget.isPasswordField ? _passwordNotVisible : false,
        inputFormatters: widget.isNumbersOnly
            ? [
                FilteringTextInputFormatter.allow(RegExp(r'[.\-0-9]')),
                TextInputFormatter.withFunction((oldValue, newValue) {
                  try {
                    final text = newValue.text;
                    if (text.isNotEmpty) double.parse(text);
                    return newValue;
                  } catch (e) {
                    log(e.toString());
                  }
                  return oldValue;
                })
              ]
            : [],
        style: const TextStyle(fontSize: 16, color: AppColors.primary),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.textFieldBorder, width: 1.0),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.textFieldBorder,
                  width: 1.0),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
            ),
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 10.0),
                borderSide: const BorderSide(color: AppColors.atWarningRed)),
            hintStyle: const TextStyle(
                color: AppColors.onSecondary,
                fontFamily: 'Poppins',
                fontSize: 12),
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
            hintText: widget.hintText ?? 'Enter a text here',
            //labelText: widget.hintText ?? 'Enter a text here',
            labelStyle: const TextStyle(
                fontSize: 16.0, height: 1, fontFamily: 'Poppins'),
            alignLabelWithHint: true,
            fillColor: AppColors.white,
            filled: true,
            prefixIcon: widget.isPrefixIcon
                ? const Icon(
                    Icons.search,
                    color: AppColors.primary,
                    size: 25,
                  )
                : null,
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordNotVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.primary,
                    ),
                    onPressed: widget.isPasswordField
                        ? () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordNotVisible = !_passwordNotVisible;
                            });
                          }
                        : () {
                            setState(() {
                              widget.textEditingController?.clear();
                            });
                          },
                  )
                : null),
      ),
    );
  }
}
