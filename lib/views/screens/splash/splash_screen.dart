import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/config/route/app_router.gr.dart';
import 'package:flutter_ecommerce_app/gen/assets.gen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 1800),
    );
    useEffect(() {
      controller.forward();
      return null;
    }, [controller]);

    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        width: 1.sw,
        height: 1.sh,
        child: Lottie.asset(
          Assets.jsons.splashAnimation,
          controller: controller,
          onLoaded: (composition) {
            controller.duration = composition.duration;
            controller.forward().whenComplete(() {
              //TODOs: Check if the user is logged in or not
              // If logged in, navigate to home screen
              // If not, navigate to onboarding screen
              context.router.replace(const OnboardingRoute());
            });
          },
        ),
      ),
    );
  }
}
