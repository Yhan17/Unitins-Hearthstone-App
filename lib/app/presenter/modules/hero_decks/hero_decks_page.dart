import 'package:flutter/material.dart';
import 'package:hearthstone_app/app/presenter/core/routes/args/hero_details_args.dart';
import 'package:hearthstone_app/app/presenter/core/routes/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/routes/args/hero_decks_args.dart';
import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_images.dart';
import '../../shared/widgets/scaffold/hearthstone_scaffold.dart';
import 'widgets/hero_card_widget.dart';

class HeroDecksPage extends HearthstoneScaffold {
  final HeroDecksArgs args;
  const HeroDecksPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget buildContent(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Hero(
          tag: 'hearthstone',
          child: Image.asset(
            AppImages.hearthstoneLogo,
            width: 250,
            height: 117,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Divider(
                  color: AppColors.textColor,
                ),
              ),
              ...List.generate(
                args.heroList.length,
                (index) {
                  return HeroCardWidget(
                    image: args.heroList[index].image,
                    heroName: args.heroList[index].name,
                    className: args.heroList[index].className,
                    onTap: () => AppRoutes.heroDetails.push(context, arguments: HeroDetailsArgs(args.heroList[index])),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
