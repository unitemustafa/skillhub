import 'package:flutter/material.dart';
import 'package:skillhub/core/local/app_database.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/network/api_exception.dart';
import 'package:skillhub/core/localization/app_localizations.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/core/theme/app_colors.dart';

import 'package:skillhub/core/widgets/app_section_header.dart';
import 'package:skillhub/core/widgets/skillhub_bottom_nav_bar.dart';
import 'package:skillhub/features/home/presentation/widgets/dashboard_app_bar.dart';
import 'package:skillhub/features/home/presentation/widgets/dashboard_notification_card.dart';
import 'package:skillhub/features/home/presentation/widgets/dashboard_stats_grid.dart';

import 'package:skillhub/features/players/presentation/pages/players_page.dart';
import 'package:skillhub/features/notifications/presentation/pages/notifications_page.dart';
import 'package:skillhub/features/profile/presentation/pages/profile_page.dart';
import 'package:skillhub/features/subscriptions/presentation/pages/subscriptions_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  int _previousIndex = 0;

  void _selectTab(int index) {
    if (_currentIndex == index) {
      return;
    }
    setState(() {
      _previousIndex = _currentIndex;
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _DashboardHome(onTabSelected: _selectTab),
      const PlayersPage(showBackButton: false),
      const SubscriptionsPage(showBackButton: false),
      const ProfilePage(showBackButton: false),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 260),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) {
          final movingForward = _currentIndex >= _previousIndex;
          final offsetTween = Tween<Offset>(
            begin: Offset(movingForward ? 0.08 : -0.08, 0),
            end: Offset.zero,
          );
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: animation.drive(offsetTween),
              child: child,
            ),
          );
        },
        child: KeyedSubtree(
          key: ValueKey(_currentIndex),
          child: pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: SkillHubBottomNavBar(
        currentIndex: _currentIndex,
        onDestinationSelected: _selectTab,
      ),
    );
  }
}

class _DashboardHome extends StatelessWidget {
  _DashboardHome({required this.onTabSelected});

  final ValueChanged<int> onTabSelected;

  final _apiClient = ApiClient();
  final _database = AppDatabase.instance;
  final _sessionService = SessionService();

  Future<DashboardStats> _loadStats() async {
    final session = await _sessionService.readLastSession();
    if (session != null) {
      try {
        return await _loadLocalStats(session);
      } catch (_) {
        // Fall through to the API if the local cache is not ready yet.
      }
    }

    final response = await _apiClient.get('/dashboard');
    return DashboardStats.fromJson(response as Map<String, dynamic>);
  }

  Future<DashboardStats> _loadLocalStats(LocalSession session) async {
    final now = DateTime.now();
    final monthStart = DateTime(now.year, now.month);
    final nextMonthStart = DateTime(now.year, now.month + 1);

    final players =
        await (_database.select(_database.localPlayers)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.deletedAt.isNull()))
            .get();
    final subscriptions =
        await (_database.select(_database.localSubscriptions)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.deletedAt.isNull()))
            .get();
    final evaluations =
        await (_database.select(_database.localEvaluations)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.deletedAt.isNull()))
            .get();
    final transactions =
        await (_database.select(_database.localFinanceTransactions)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.deletedAt.isNull()))
            .get();
    final notifications =
        await (_database.select(_database.localNotifications)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.deletedAt.isNull()))
            .get();

    final activeSubscriptions = subscriptions
        .where((subscription) => subscription.endDate.isAfter(now))
        .length;
    final expiringSubscriptions = subscriptions
        .where(
          (subscription) =>
              subscription.endDate.isAfter(now) &&
              subscription.endDate.difference(now).inDays <= 7,
        )
        .length;
    final monthlyEvaluations = evaluations
        .where(
          (evaluation) =>
              !evaluation.evaluationDate.isBefore(monthStart) &&
              evaluation.evaluationDate.isBefore(nextMonthStart),
        )
        .length;
    final monthlyTransactions = transactions.where(
      (transaction) =>
          !transaction.occurredAt.isBefore(monthStart) &&
          transaction.occurredAt.isBefore(nextMonthStart),
    );
    final income = monthlyTransactions
        .where((transaction) => transaction.type == 'income')
        .fold<double>(0, (sum, transaction) => sum + transaction.amount);
    final expenses = monthlyTransactions
        .where((transaction) => transaction.type == 'expense')
        .fold<double>(0, (sum, transaction) => sum + transaction.amount);

    return DashboardStats(
      players: players.length,
      activePlayers: players.where((player) => player.isActive).length,
      activeSubscriptions: activeSubscriptions,
      expiringSubscriptions: expiringSubscriptions,
      evaluations: monthlyEvaluations,
      income: income,
      expenses: expenses,
      balance: income - expenses,
      unreadNotifications: notifications
          .where((notification) => !notification.isRead)
          .length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        DashboardAppBar(
          onNotificationsTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const NotificationsPage()),
            );
          },
          onProfileTap: () => onTabSelected(3),
        ),
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
    );
  }
}
