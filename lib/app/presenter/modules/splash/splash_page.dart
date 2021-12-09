import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/routes/routes.dart';
import '../../shared/notifiers/auth_notifier.dart';
import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_images.dart';
import '../../shared/widgets/modal/error_modal.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authNotifierProvider.notifier);
    useEffect(() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _userRedirect(
          context,
          notifier: authNotifier,
        );
      });
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
    final String? accessToken = prefs.getString('token');
    final int? expiresIn = prefs.getInt('expires_in');
    final DateTime? createdAt = prefs.getString('token_creation') != null
        ? DateTime.parse(prefs.getString('token_creation')!)
        : null;

    if (accessToken != null) {
      if (createdAt!
          .add(Duration(seconds: expiresIn!))
          .isBefore(DateTime.now())) {
        _requestToken(
          context,
          notifier: notifier,
          prefs: prefs,
        );
      } else {
        _verifyIfFirstEntrance(prefs, context: context);
      }
    } else {
      _requestToken(
        context,
        notifier: notifier,
        prefs: prefs,
      );
    }
  }

  void _verifyIfFirstEntrance(
    SharedPreferences prefs, {
    required BuildContext context,
  }) async {
    final alreadyLogged = prefs.getBool('alreadyLogged');

    if (alreadyLogged == null || alreadyLogged == false) {
      prefs.setBool('alreadyLogged', true);
      AppRoutes.cinematic.pushReplacement(context, arguments: noArgs);
    } else {
      AppRoutes.home.pushReplacement(context, arguments: noArgs);
    }

    await Future.delayed(const Duration(seconds: 2));
  }

  void _requestToken(
    BuildContext context, {
    required SharedPreferences prefs,
    required AuthNotifier notifier,
  }) async {
    await notifier.getToken();
    notifier.last.maybeWhen(
      loadSuccess: (_) => _verifyIfFirstEntrance(prefs, context: context),
      loadFailure: (_) => const ErrorModal().show(context),
      orElse: () => null,
    );
  }
}
