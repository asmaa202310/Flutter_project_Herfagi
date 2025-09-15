import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import '../../../utils/size_config.dart';

class TagLineWidget extends StatelessWidget {
  const TagLineWidget({
    super.key,
    required AnimationController controller,
    required Animation<Offset> slideAnimation,
  }) : _controller = controller,
       _slideAnimation = slideAnimation;

  final AnimationController _controller;
  final Animation<Offset> _slideAnimation;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _slideAnimation.value * 20,
          child: child,
        );
      },
      child: Text(
        context.localization.tagLine,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: SizeConfig.width(fraction: 0.06),
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
