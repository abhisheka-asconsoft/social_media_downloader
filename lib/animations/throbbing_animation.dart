import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ThrobbingAnimation extends HookWidget {
  final Widget child;
  const ThrobbingAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final throbbingAnimationController =
        useAnimationController(duration: const Duration(seconds: 1));
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          throbbingAnimationController.forward();
          throbbingAnimationController.addListener(() {
            if (throbbingAnimationController.status ==
                AnimationStatus.completed) {
              throbbingAnimationController.reverse();
            }
            if (throbbingAnimationController.status ==
                AnimationStatus.dismissed) {
              throbbingAnimationController.forward();
            }
          });
        });
        return null;
      },
      const [],
    );

    return AnimatedBuilder(
      animation: throbbingAnimationController,
      child: child,
      builder: (context, child) {
        return Transform.scale(
          scale: 1 + throbbingAnimationController.value * 0.5,
          child: child,
        );
      },
    );
  }
}
