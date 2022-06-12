import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ShakingAnimation extends HookWidget {
  final Widget child;
  const ShakingAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shakingAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 50));
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          shakingAnimationController.forward();
          shakingAnimationController.addListener(() {
            if (shakingAnimationController.status ==
                AnimationStatus.completed) {
              shakingAnimationController.reverse();
            }
            if (shakingAnimationController.status ==
                AnimationStatus.dismissed) {
              shakingAnimationController.forward();
            }
          });
        });
        return null;
      },
      const [],
    );

    return AnimatedBuilder(
      animation: shakingAnimationController,
      child: child,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            shakingAnimationController.value * 2,
            0
          ),
          child: child,
        );
      },
    );
  }
}
