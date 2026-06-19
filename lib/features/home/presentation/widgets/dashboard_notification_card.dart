import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/features/notifications/presentation/pages/notifications_page.dart';

class DashboardNotificationCard extends StatefulWidget {
  const DashboardNotificationCard({super.key});

  @override
  State<DashboardNotificationCard> createState() =>
      _DashboardNotificationCardState();
}

class _DashboardNotificationCardState extends State<DashboardNotificationCard> {
  final _apiClient = ApiClient();
  late Future<List<NotificationItem>> _notificationsFuture;
  late PageController _pageController;
  Timer? _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _notificationsFuture = _loadNotifications();
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted || !_pageController.hasClients) {
        return;
      }
      final currentPage = _pageController.page?.round() ?? 0;
      final nextPage = currentPage + 1;
      _notificationsFuture.then((notifications) {
        if (!mounted ||
            !_pageController.hasClients ||
            notifications.take(3).isEmpty) {
          return;
        }
        _pageController.animateToPage(
          nextPage >= notifications.take(3).length ? 0 : nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NotificationItem>>(
      future: _notificationsFuture,
      builder: (context, snapshot) {
        final notifications = (snapshot.data ?? const <NotificationItem>[])
            .take(3)
            .toList(growable: false);

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (notifications.isEmpty) {
          return const AppSurfaceCard(
            child: Text(
              'لا توجد إشعارات حديثة',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary),
            ),
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100,
              child: PageView.builder(
                controller: _pageController,
                itemCount: notifications.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 2,
                    ),
                    child: AppSurfaceCard(
                      padding: const EdgeInsets.all(16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const NotificationsPage(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: notification.isRead
                                  ? AppColors.mutedText.withValues(alpha: 0.1)
                                  : AppColors.accentBlueDark.withValues(
                                      alpha: 0.1,
                                    ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Iconsax.notification_bing,
                              color: notification.isRead
                                  ? AppColors.textSecondary
                                  : AppColors.accentBlueDark,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  notification.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: notification.isRead
                                        ? FontWeight.w500
                                        : FontWeight.bold,
                                    color: notification.isRead
                                        ? AppColors.textSecondary
                                        : AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  notification.subtitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: notification.isRead
                                        ? AppColors.mutedText
                                        : Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (!notification.isRead) ...[
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 4,
                              backgroundColor: AppColors.accentBlueDark,
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                notifications.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: _currentIndex == index ? 24 : 6,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? AppColors.accentBlueDark
                        : AppColors.mutedText.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<List<NotificationItem>> _loadNotifications() async {
    final response = await _apiClient.get('/notifications');
    final items = response is List<dynamic> ? response : const [];
    return items
        .whereType<Map<String, dynamic>>()
        .map(NotificationItem.fromJson)
        .toList(growable: false);
  }
}
