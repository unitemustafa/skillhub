import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/network/api_exception.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';

class NotificationItem {
  const NotificationItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isRead,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    final createdAt = DateTime.tryParse(json['createdAt']?.toString() ?? '');
    return NotificationItem(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      subtitle: json['body']?.toString() ?? '',
      time: createdAt == null ? '' : _formatDate(createdAt),
      isRead: json['isRead'] == true,
    );
  }

  final String id;
  final String title;
  final String subtitle;
  final String time;
  final bool isRead;

  static String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final _apiClient = ApiClient();
  late Future<List<NotificationItem>> _notificationsFuture;

  @override
  void initState() {
    super.initState();
    _notificationsFuture = _loadNotifications();
  }

  Future<List<NotificationItem>> _loadNotifications() async {
    final response = await _apiClient.get('/notifications');
    final items = response is List<dynamic> ? response : const [];
    return items
        .whereType<Map<String, dynamic>>()
        .map(NotificationItem.fromJson)
        .toList(growable: false);
  }

  Future<void> _markAllAsRead() async {
    await _apiClient.patch('/notifications/read-all');
    setState(() {
      _notificationsFuture = _loadNotifications();
    });
  }

  Future<void> _markAsRead(NotificationItem item) async {
    if (item.isRead) {
      return;
    }
    await _apiClient.patch('/notifications/${item.id}/read');
    setState(() {
      _notificationsFuture = _loadNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: FutureBuilder<List<NotificationItem>>(
          future: _notificationsFuture,
          builder: (context, snapshot) {
            final notifications = snapshot.data ?? const <NotificationItem>[];

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  floating: true,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Iconsax.arrow_right_3, color: AppColors.navy),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: Text(
                    'الإشعارات',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                ),
                if (notifications.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: InkWell(
                        onTap: () async {
                          try {
                            await _markAllAsRead();
                          } on ApiException catch (error) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  error.message,
                                  textAlign: TextAlign.center,
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.error,
                              ),
                            );
                          }
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.greenBright.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.tick_circle,
                                color: AppColors.greenBright,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  'تعليم الكل كمقروء',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                if (snapshot.connectionState == ConnectionState.waiting)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (snapshot.hasError)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: _NotificationsMessage(
                      title: 'تعذر تحميل الإشعارات',
                      message: snapshot.error is ApiException
                          ? (snapshot.error! as ApiException).message
                          : 'حدث خطأ غير متوقع أثناء الاتصال بالخادم.',
                      onRetry: () {
                        setState(() {
                          _notificationsFuture = _loadNotifications();
                        });
                      },
                    ),
                  )
                else if (notifications.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: _NotificationsMessage(
                      title: 'لا توجد إشعارات حاليًا',
                      message: 'كل شيء هادئ الآن.',
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList.separated(
                      itemCount: notifications.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return AppSurfaceCard(
                          onTap: () async {
                            try {
                              await _markAsRead(notification);
                            } on ApiException catch (error) {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    error.message,
                                    textAlign: TextAlign.center,
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.error,
                                ),
                              );
                            }
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: notification.isRead
                                      ? AppColors.mutedText.withValues(
                                          alpha: 0.1,
                                        )
                                      : AppColors.accentBlueDark.withValues(
                                          alpha: 0.1,
                                        ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Iconsax.notification_bing,
                                  color: notification.isRead
                                      ? Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.color
                                            ?.withValues(alpha: 0.7)
                                      : AppColors.accentBlueDark,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            notification.title,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: notification.isRead
                                                  ? FontWeight.w500
                                                  : FontWeight.bold,
                                              color: notification.isRead
                                                  ? Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.color
                                                        ?.withValues(alpha: 0.7)
                                                  : Theme.of(
                                                      context,
                                                    ).colorScheme.onSurface,
                                            ),
                                          ),
                                        ),
                                        if (!notification.isRead) ...[
                                          const SizedBox(width: 8),
                                          const CircleAvatar(
                                            radius: 4,
                                            backgroundColor:
                                                AppColors.accentBlueDark,
                                          ),
                                        ],
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      notification.subtitle,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: notification.isRead
                                            ? AppColors.mutedText
                                            : Colors.grey.shade700,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      notification.time,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: AppColors.mutedText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NotificationsMessage extends StatelessWidget {
  const _NotificationsMessage({
    required this.title,
    required this.message,
    this.onRetry,
  });

  final String title;
  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Iconsax.notification_bing,
              size: 72,
              color: AppColors.mutedText.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 18),
              OutlinedButton(
                onPressed: onRetry,
                child: const Text('إعادة المحاولة'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
