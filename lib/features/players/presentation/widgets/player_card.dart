import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:skillhub/features/players/presentation/pages/player_details_page.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key, required this.player});

  final PlayerSummary player;

  @override
  Widget build(BuildContext context) {
    final mutedTextColor = Theme.of(
      context,
    ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7);

    return RepaintBoundary(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayerDetailsPage(player: player),
            ),
          );
        },
        child: AppSurfaceCard(
          child: Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.accentBlueSoft,
                child: Icon(Iconsax.user, color: AppColors.accentBlue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            player.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                        if (player.isActive) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.greenBright.withValues(
                                alpha: 0.12,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'نشط',
                              style: TextStyle(
                                color: AppColors.greenBright,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 16,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Iconsax.cake,
                              size: 14,
                              color: AppColors.mutedText,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              player.ageLabel,
                              style: TextStyle(
                                color: mutedTextColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Iconsax.call,
                              size: 14,
                              color: AppColors.mutedText,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              player.phone,
                              style: TextStyle(
                                color: mutedTextColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Iconsax.arrow_left_2, color: AppColors.mutedText),
            ],
          ),
        ),
      ),
    );
  }
}
