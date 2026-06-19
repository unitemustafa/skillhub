import 'package:flutter/material.dart';
import 'package:skillhub/core/theme/app_colors.dart';

import 'package:iconsax/iconsax.dart';

enum PlayersAgeStage {
  all('كل المراحل'),
  buds('براعم'),
  cubs('أشبال'),
  juniors('ناشئين'),
  youth('شباب');

  const PlayersAgeStage(this.label);

  final String label;
}

class PlayersAppBar extends StatelessWidget {
  const PlayersAppBar({
    super.key,
    required this.selectedAgeStage,
    required this.onAgeStageChanged,
  });

  final PlayersAgeStage selectedAgeStage;
  final ValueChanged<PlayersAgeStage> onAgeStageChanged;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: 66,
      backgroundColor: AppColors.accentBlueDark,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      leading: IconButton(
        icon: const Icon(Iconsax.arrow_right_3, color: AppColors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'اللاعبين',
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(116),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'دور على لاعب...',
                  fillColor: AppColors.white,
                  prefixIcon: Icon(
                    Iconsax.search_normal,
                    color: AppColors.mutedText,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: PlayersAgeStage.values.map((stage) {
                      final isSelected = stage == selectedAgeStage;
                      return Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: ChoiceChip(
                          label: Text(stage.label),
                          selected: isSelected,
                          showCheckmark: false,
                          side: BorderSide(
                            color: isSelected
                                ? AppColors.accentBlue
                                : AppColors.border,
                          ),
                          backgroundColor: AppColors.white.withValues(
                            alpha: 0.18,
                          ),
                          selectedColor: AppColors.white,
                          labelStyle: TextStyle(
                            color: isSelected
                                ? AppColors.accentBlueDark
                                : AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                          onSelected: (_) => onAgeStageChanged(stage),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
