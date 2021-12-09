import 'package:flutter/material.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_images.dart';

class BannerWidget extends StatelessWidget {
  final String text;
  const BannerWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.banner,
              height: 102,
            ),
          ],
        ),
        SizedBox(
          height: 100,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                text,
                style: AppTypography.appTypography,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
