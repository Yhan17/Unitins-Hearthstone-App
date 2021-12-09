import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../shared/theme/app_typography.dart';
import '../../../shared/widgets/divider/divider_widget.dart';

class HeroCardWidget extends HookWidget {
  final String image;
  final String heroName;
  final String className;
  final VoidCallback onTap;
  const HeroCardWidget({
    Key? key,
    required this.image,
    required this.heroName,
    required this.className,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: Hero(
              tag: image,
              child: Row(
                children: [
                  Image.network(
                    image,
                    height: 115,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        heroName,
                        style: AppTypography.heroNameMd,
                      ),
                      Text(
                        className,
                        style: AppTypography.classNameMd,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const DividerWidget(),
        ],
      ),
    );
  }
}
