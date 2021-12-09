import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import '../../core/routes/args/card_list_args.dart';
import '../../shared/theme/app_colors.dart';
import '../../shared/utils/app_bridge.dart';
import '../../shared/widgets/banner/banner_widget.dart';
import '../../shared/widgets/scaffold/hearthstone_scaffold.dart';

class CardListPage extends HearthstoneScaffold {
  final CardListArgs args;

  const CardListPage({Key? key, required this.args}) : super(key: key);

  @override
  Widget buildContent(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        const SafeArea(
          child: BannerWidget(
            text: 'Cards',
          ),
        ),
        StackedCardCarousel(
          items: List.generate(
            8,
            (index) => Padding(
              padding: const EdgeInsets.only(top: 80),
              child: GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (dialogContext) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12, right: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => Navigator.of(dialogContext).pop(),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.network(args.cards[index].image),
                      Text(
                        args.cards[index].name,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.heroName,
                          child: IconButton(
                            onPressed: () async {
                              await AppBridge.openVr();
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 357,
                    maxWidth: 259,
                  ),
                  child: Image.network(
                    args.cards[index].image,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
