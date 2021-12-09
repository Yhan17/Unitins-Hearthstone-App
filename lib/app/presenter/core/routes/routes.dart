import 'package:flutter/material.dart';
import 'package:hearthstone_app/app/presenter/core/routes/args/card_list_args.dart';
import 'package:hearthstone_app/app/presenter/modules/card_list/card_list_page.dart';
import 'package:hearthstone_app/app/presenter/modules/hero_details/hero_details_page.dart';

import '../../modules/cinematic/cinematic_page.dart';
import '../../modules/hero_decks/hero_decks_page.dart';
import '../../modules/home/home_page.dart';
import '../../modules/splash/splash_page.dart';
import 'args/hero_decks_args.dart';
import 'args/hero_details_args.dart';

part 'page_router.dart';

abstract class AppRoutes {
  static const splash = PageRoute<NoArgs>('/');
  static const cinematic = PageRoute<NoArgs>('/cinematic');
  static const home = PageRoute<NoArgs>('/home');
  static const heroesDeck = PageRoute<HeroDecksArgs>('/herodecks');
  static const heroDetails = PageRoute<HeroDetailsArgs>('/herodetails');
  static const cardList = PageRoute<CardListArgs>('/cardlist');

  // static const repoContributors =
  //     PageRoute<RepoContributorsArgs>('/repo-contributors');

  static Map<String, WidgetBuilder> get builders => {
        splash.path: (_) => const SplashPage(),
        cinematic.path: (_) => const CinematicPage(),
        home.path: (_) => const HomePage(),
        heroesDeck.path: (context) => HeroDecksPage(args: _argumentsOf(context),),
        heroDetails.path: (context) => HeroDetailsPage(args: _argumentsOf(context),),
        cardList.path: (context) => CardListPage(args: _argumentsOf(context),),
        // userProfile.path: (context) {
        //   return UserProfilePage(args: _argumentsOf(context));
        // },
      };

  static T _argumentsOf<T>(context) {
    return ModalRoute.of(context)!.settings.arguments as T;
  }
}
