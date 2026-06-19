import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/communications/presentation/pages/messages_page.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';

class PlayerCommunicationSection extends StatelessWidget {
  const PlayerCommunicationSection({super.key, required this.player});

  final PlayerSummary player;

  @override
  Widget build(BuildContext context) {
    return AppSurfaceCard(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'التواصل مع ولي الأمر',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Iconsax.message,
                color: AppColors.greenBright,
                size: 20,
              ),
            ],
          ),
          childrenPadding: EdgeInsets.zero,
          children: [
            _buildCommunicationButton(
              context: context,
              title: 'تواصل مع ولي الأمر',
              icon: Iconsax.call,
              color: AppColors.navy,
              onTap: () {
                _showCommunicationBottomSheet(context);
              },
            ),
            const SizedBox(height: 12),
            _buildCommunicationButton(
              context: context,
              title: 'تذكير بالاشتراك',
              icon: Iconsax.notification,
              color: AppColors.gold,
              onTap: () => _openMessages(context, 'تذكير بالاشتراك'),
            ),
            const SizedBox(height: 12),
            _buildCommunicationButton(
              context: context,
              title: 'تذكير بانتهاء الاشتراك',
              icon: Iconsax.calendar_remove,
              color: AppColors.red,
              onTap: () => _openMessages(context, 'انتهاء الاشتراك'),
            ),
            const SizedBox(height: 12),
            _buildCommunicationButton(
              context: context,
              title: 'متابعة نتيجة التقييم',
              icon: Iconsax.chart,
              color: AppColors.accentBlue,
              onTap: () => _openMessages(context, 'نتيجة التقييم'),
            ),
            const SizedBox(height: 12),
            _buildCommunicationButton(
              context: context,
              title: 'رسالة مخصصة',
              icon: Iconsax.edit_2,
              color: AppColors.greenBright,
              onTap: () => _openMessages(context),
            ),
          ],
        ),
      ),
    );
  }

  void _openMessages(BuildContext context, [String? template]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MessagesPage(player: player, initialTemplate: template),
      ),
    );
  }

  Widget _buildCommunicationButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: color.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Iconsax.arrow_right_3,
              color: AppColors.mutedText,
              size: 16,
            ),
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Icon(icon, color: color, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showCommunicationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'إكمال الإجراء باستخدام',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildAppOption(
                      context: context,
                      icon: Icons.chat,
                      color: AppColors.greenBright,
                      title: 'واتساب للأعمال',
                      onTap: () => Navigator.pop(context),
                    ),
                    _buildAppOption(
                      context: context,
                      icon: Icons.chat_bubble,
                      color: AppColors.greenBright,
                      title: 'واتساب',
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppOption({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, color: AppColors.white, size: 32),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(
                context,
              ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
