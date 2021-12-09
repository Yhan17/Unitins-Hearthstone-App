import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Divider(
        color: AppColors.textColor,
      ),
    );
  }
}
