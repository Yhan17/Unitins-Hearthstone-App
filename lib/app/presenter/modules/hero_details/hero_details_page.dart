import 'package:flutter/material.dart';
import 'package:hearthstone_app/app/presenter/core/routes/args/card_list_args.dart';
import 'package:hearthstone_app/app/presenter/core/routes/routes.dart';
import 'package:hearthstone_app/app/presenter/shared/theme/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import '../../core/routes/args/hero_details_args.dart';
import '../../shared/theme/app_images.dart';
import '../../shared/theme/app_typography.dart';
import '../../shared/utils/app_pipes.dart';
import '../../shared/widgets/banner/banner_widget.dart';
import '../../shared/widgets/divider/divider_widget.dart';
import '../../shared/widgets/scaffold/hearthstone_scaffold.dart';

class HeroDetailsPage extends HearthstoneScaffold {
  final HeroDetailsArgs args;
  const HeroDetailsPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget buildContent(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppImages.hearthstoneLogo,
            width: 250,
            height: 117,
          ),
          const DividerWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Hero(
              tag: args.hero.image,
              child: Row(
                children: [
                  Image.network(
                    args.hero.image,
                    height: 200,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        args.hero.name,
                        style: AppTypography.heroNameLg,
                      ),
                      Text(
                        args.hero.className,
                        style: AppTypography.classNameLg,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const DividerWidget(),
          const BannerWidget(
            text: 'Hero Power',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 350,
              ),
              child: Row(
                children: [
                  Flexible(
                    child: Image.network(
                      args.hero.heroPower.image,
                      height: 200,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            args.hero.heroPower.name,
                            style: AppTypography.heroNameLg,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            AppPipes.replaceHtmlTags(args.hero.heroPower.text),
                            style: AppTypography.classNameLg,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const DividerWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.heroName,
              child: IconButton(
                onPressed: () {
                  AppRoutes.cardList.push(
                    context,
                    arguments: CardListArgs(args.hero.cards),
                  );
                },
                icon: const Icon(Icons.view_carousel_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
