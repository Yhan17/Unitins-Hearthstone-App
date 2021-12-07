import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../core/routes/routes.dart';

import '../../shared/theme/app_images.dart';
import '../../shared/widgets/scaffold/hearthstone_scaffold.dart';

class HomePage extends HearthstoneScaffold {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    final _controller = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    _controller.forward();

    final Animation<double> _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    useEffect(() {
      _userRedirect(context);
    }, const []);

    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Hero(
          tag: 'hearthstone',
          child: Image.asset(AppImages.hearthstoneLogo),
        ),
      ),
    );
  }

  Future<void> _userRedirect(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4));
    AppRoutes.heroesDeck.push(context, arguments: noArgs);
  }
}
