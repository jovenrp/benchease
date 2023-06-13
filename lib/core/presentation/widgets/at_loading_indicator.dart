import 'package:flutter/material.dart';
import 'package:benchease/core/domain/utils/constants/app_colors.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/assets.gen.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader(
      {Key? key, this.height, this.width, this.color, this.strokeWidth})
      : super(key: key);

  final double? height;
  final double? width;
  final double? strokeWidth;
  final Color? color;

  @override
  _CustomLoader createState() => _CustomLoader();
}

class _CustomLoader extends State<CustomLoader> with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 17,
      width: widget.width ?? 17,
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
        child: SvgPicture.asset(
          Assets.images.cogLoader.path,
          color: widget.color ?? AppColors.secondary,
        ),
      ),
    );
  }
}
