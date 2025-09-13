import 'package:flutter/material.dart';
import '/utils/size_config.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Image.asset(
        'assets/images/image1.png',
        width: SizeConfig.width(fraction: 0.5),
        fit: BoxFit.fill,
      ),
    );
  }
}
