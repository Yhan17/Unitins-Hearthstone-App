import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/routes/args/hero_decks_args.dart';
import '../../core/routes/routes.dart';
import '../../shared/notifiers/deck_notifier.dart';
import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_images.dart';
import '../../shared/theme/app_typography.dart';
import '../../shared/widgets/modal/error_modal.dart';
import '../../shared/widgets/scaffold/hearthstone_scaffold.dart';
import 'mocks/deck_ids.dart';

class HomePage extends HearthstoneScaffold {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context, WidgetRef ref) {
    final _controller = useAnimationController(
      duration: const Duration(seconds: 4),
    );
    final Animation<double> _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    final deckNotifier = ref.watch(deckNotifierProvider.notifier);

    _controller.forward();

    ref.listen<DeckState>(deckNotifierProvider, (_, state) {
      state.maybeWhen(
        loadSuccess: (list) => AppRoutes.heroesDeck.pushReplacement(
          context,
          arguments: HeroDecksArgs(list),
        ),
        loadFailure: (_) => const ErrorModal().show(context),
        orElse: () async => await Future.delayed(
          const Duration(seconds: 4),
        ),
      );
    });
    useEffect(() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        deckNotifier.getHeroes(deckIds);
      });
    }, const []);

    return Center(
      child: Consumer(
        builder: (_, ref, __) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _animation,
                child: Hero(
                  tag: 'hearthstone',
                  child: Image.asset(AppImages.hearthstoneLogo),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Aguarde, estamos tirando a poeira das espadas para você...',
                style: AppTypography.appTypography,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: AppColors.textColor,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
