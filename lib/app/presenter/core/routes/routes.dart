import 'package:flutter/material.dart';
import '../../modules/hero_decks/hero_decks.dart';
import '../../modules/home/home_page.dart';

import '../../modules/cinematic/cinematic_page.dart';
import '../../modules/splash/splash_page.dart';

part 'page_router.dart';

abstract class AppRoutes {
  static const splash = PageRoute<NoArgs>('/');
  static const cinematic = PageRoute<NoArgs>('/cinematic');
  static const home = PageRoute<NoArgs>('/home');
  static const heroesDeck = PageRoute<NoArgs>('/herodecks');

  // static const repoContributors =
  //     PageRoute<RepoContributorsArgs>('/repo-contributors');

  static Map<String, WidgetBuilder> get builders => {
        splash.path: (_) => const SplashPage(),
        cinematic.path: (_) => const CinematicPage(),
        home.path: (_) => const HomePage(),
        heroesDeck.path: (_) => const HeroDecks(),
        // userProfile.path: (context) {
        //   return UserProfilePage(args: _argumentsOf(context));
        // },
      };

  static T _argumentsOf<T>(context) {
    return ModalRoute.of(context)!.settings.arguments as T;
  }
}
