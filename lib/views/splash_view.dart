import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_downloader/animations/throbbing_animation.dart';
import 'package:social_media_downloader/widgets/app_logo.dart';

import '../animations/shaking_animation.dart';
import '../helpers/size_helper.dart';
import 'home_view.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeHelper.instance.context = context;
    final _startAnimation = useState(false);
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _startAnimation.value = true;
        });
        // Future.delayed(
        //     const Duration(seconds: 3),
        //     () => Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => const HomeView())));
        return null;
      },
      const [],
    );
    return const Scaffold(
      body: Center(
        child: ThrobbingAnimation(
          child: AppLogo(),
        ),
      ),
    );
  }
}
