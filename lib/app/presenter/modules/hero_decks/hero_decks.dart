import 'package:flutter/material.dart';
import '../../shared/theme/app_images.dart';
import '../../shared/widgets/scaffold/hearthstone_scaffold.dart';

class HeroDecks extends HearthstoneScaffold {
  const HeroDecks({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
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
            children: [],
          ),
        ),
      ],
    );
  }
}
