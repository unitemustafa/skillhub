import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';

class PlayerInfoSection extends StatelessWidget {
  const PlayerInfoSection({super.key, required this.player});

  final PlayerSummary player;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionTitle('معلومات اللاعب'),
        const SizedBox(height: 12),
        AppSurfaceCard(
          child: Column(
            children: [
              _buildInfoRow(
                context: context,
                icon: Iconsax.cake,
                title: 'تاريخ الميلاد',
                value: player.birthDate ?? 'غير متوفر',
              ),
              const Divider(color: AppColors.border, height: 24),
              _buildInfoRow(
                context: context,
                icon: Iconsax.user,
                title: 'العمر',
                value: player.ageLabel,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildSectionTitle('معلومات ولي الأمر'),
        const SizedBox(height: 12),
        AppSurfaceCard(
          child: Column(
            children: [
              _buildInfoRow(
                context: context,
                icon: Iconsax.user,
                title: 'اسم ولي الأمر',
                value: player.guardianName ?? 'غير متوفر',
              ),
              const Divider(color: AppColors.border, height: 24),
              _buildInfoRow(
                context: context,
                icon: Iconsax.people,
                title: 'صلة القرابة',
                value: player.guardianRelation ?? 'غير متوفر',
              ),
              const Divider(color: AppColors.border, height: 24),
              _buildInfoRow(
                context: context,
                icon: Iconsax.briefcase,
                title: 'مهنة ولي الأمر',
                value: player.guardianJob ?? 'غير متوفر',
              ),
              const Divider(color: AppColors.border, height: 24),
              _buildInfoRow(
                context: context,
                icon: Iconsax.call,
                title: 'رقم هاتف ولي الأمر',
                value: player.phone,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.navy,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInfoRow({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Theme.of(
                  context,
                ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.accentBlueSoft,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.accentBlue, size: 20),
        ),
      ],
    );
  }
}
