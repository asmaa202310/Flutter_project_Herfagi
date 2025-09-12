import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Center(
      child: Container(
        width: SizeConfig.width(fraction: 0.5),
        height: SizeConfig.height(fraction: 0.2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage('assets/EiOMD.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
