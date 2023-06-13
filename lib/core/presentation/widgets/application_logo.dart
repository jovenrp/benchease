import 'package:flutter/cupertino.dart';
import 'package:benchease/generated/assets.gen.dart';

class ApplicationLogo extends StatelessWidget {
  const ApplicationLogo({Key? key, this.height, this.width, this.image})
      : super(key: key);

  final double? height;
  final double? width;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image(
        width: width ?? 200,
        height: height ?? 200,
        image: image ?? Assets.images.applogo,
      ),
    );
  }
}
