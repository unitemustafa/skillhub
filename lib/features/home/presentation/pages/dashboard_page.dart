import 'package:flutter/material.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/network/api_exception.dart';
import 'package:skillhub/core/localization/app_localizations.dart';
import 'package:skillhub/core/theme/app_colors.dart';

import 'package:skillhub/core/widgets/app_section_header.dart';
import 'package:skillhub/core/widgets/skillhub_bottom_nav_bar.dart';
import 'package:skillhub/features/home/presentation/widgets/dashboard_app_bar.dart';
import 'package:skillhub/features/home/presentation/widgets/dashboard_notification_card.dart';
import 'package:skillhub/features/home/presentation/widgets/dashboard_quick_actions.dart';
import 'package:skillhub/features/home/presentation/widgets/dashboard_stats_grid.dart';

import 'package:skillhub/features/players/presentation/pages/players_page.dart';
import 'package:skillhub/features/notifications/presentation/pages/notifications_page.dart';
import 'package:skillhub/features/profile/presentation/pages/profile_page.dart';
import 'package:skillhub/features/subscriptions/presentation/pages/subscriptions_page.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final _apiClient = ApiClient();

  Future<DashboardStats> _loadStats() async {
    final response = await _apiClient.get('/dashboard');
    return DashboardStats.fromJson(response as Map<String, dynamic>);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: SkillHubBottomNavBar(
        currentIndex: 0,
        onDestinationSelected: (index) {
          switch (index) {
            case 1:
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const PlayersPage()));
              break;
            case 2:
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SubscriptionsPage()),
              );
              break;
            case 3:
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const NotificationsPage()),
              );
              break;
            case 4:
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const ProfilePage()));
              break;
          }
        },
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const DashboardAppBar(),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                AppSectionHeader(
                  title: l10n.latestNotifications,
                  showAccent: true,
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const NotificationsPage(),
                        ),
                      );
                    },
                    child: Text(
                      l10n.viewAll,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.accentBlueDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const DashboardNotificationCard(),
                const SizedBox(height: 32),
                AppSectionHeader(title: l10n.quickActions),
                const SizedBox(height: 16),
                DashboardQuickActions(
                  onPlayersTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const PlayersPage()),
                    );
                  },
                ),
                const SizedBox(height: 32),
                AppSectionHeader(title: l10n.overviewStats),
                const SizedBox(height: 16),
                FutureBuilder<DashboardStats>(
                  future: _loadStats(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 132,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    if (snapshot.hasError) {
                      final message = snapshot.error is ApiException
                          ? (snapshot.error! as ApiException).message
                          : 'تعذر تحميل الإحصائيات.';
                      return Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.textSecondary),
                      );
                    }
                    return DashboardStatsGrid(stats: snapshot.data!);
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
