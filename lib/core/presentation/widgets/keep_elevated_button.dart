import 'package:flutter/material.dart';
import 'package:benchease/core/presentation/widgets/at_loading_indicator.dart';

import '../../domain/utils/constants/app_colors.dart';
import '../../domain/utils/constants/app_text_style.dart';

class KeepElevatedButton extends StatelessWidget {
  const KeepElevatedButton({
    Key? key,
    required this.text,
    this.isEnabled = true,
    this.disableText,
    this.color,
    this.disabledColor,
    this.focusNode,
    this.paddingTB,
    this.isLoading,
    this.cogColor,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final bool isEnabled;
  final Widget? disableText;
  final Color? color;
  final Color? cogColor;
  final Color? disabledColor;
  final FocusNode? focusNode;
  final VoidCallback? onPressed;
  final EdgeInsets? paddingTB;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      focusNode: focusNode,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            const Set<MaterialState> disabledStates = <MaterialState>{
              MaterialState.disabled,
              MaterialState.error,
            };

            if (states.any(disabledStates.contains)) {
              return disabledColor ?? AppColors.disabledButton;
            }

            return color ?? Theme.of(context).primaryColor;
          },
        ),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
      child: Padding(
        padding: paddingTB ?? const EdgeInsets.only(top: 10, bottom: 10),
        child: isEnabled
            ? isLoading == true
                ? CustomLoader(
                    color: cogColor,
                  )
                : Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  )
            : disableText,
      ),
    );
  }
}
