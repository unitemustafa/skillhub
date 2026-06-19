import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';

class PlayerProfileHeader extends StatelessWidget {
  const PlayerProfileHeader({super.key, required this.player});

  final PlayerSummary player;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: AppColors.accentBlueSoft,
          child: Icon(Iconsax.user, color: AppColors.accentBlue, size: 50),
        ),
        const SizedBox(height: 12),
        Text(
          player.name,
          style: const TextStyle(
            color: AppColors.navy,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (player.isActive) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.greenBright.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'نشط',
                  style: TextStyle(
                    color: AppColors.greenBright,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Iconsax.tick_circle,
                  color: AppColors.greenBright,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
