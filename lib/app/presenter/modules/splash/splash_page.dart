import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hearthstone_app/app/presenter/shared/notifiers/auth_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_images.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    useEffect(() {
      _userRedirect(
        context,
        notifier: authNotifier,
      );
    }, const []);
    return Scaffold(
      backgroundColor: AppColors.splashPageBackground,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Image.asset(AppImages.splashAnimation, fit: BoxFit.cover),
      ),
    );
  }

  void _userRedirect(
    BuildContext context, {
    required AuthNotifier notifier,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 5));
    final alreadyLogged = prefs.getBool('alreadyLogged');
    if (alreadyLogged == null || alreadyLogged == false) {
      prefs.setBool('alreadyLogged', true);
      AppRoutes.cinematic.push(context, arguments: noArgs);
    } else {
      AppRoutes.home.push(context, arguments: noArgs);
    }
  }
}
