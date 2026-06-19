import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/network/api_exception.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:skillhub/features/players/presentation/pages/new_subscription_page.dart';

class SubscriptionsPage extends StatefulWidget {
  const SubscriptionsPage({super.key});

  @override
  State<SubscriptionsPage> createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage> {
  final _apiClient = ApiClient();
  String _filter = 'الكل';
  String _query = '';
  late Future<List<_SubscriptionItem>> _subscriptionsFuture;

  @override
  void initState() {
    super.initState();
    _subscriptionsFuture = _loadSubscriptions();
  }

  Future<List<_SubscriptionItem>> _loadSubscriptions() async {
    final response = await _apiClient.get('/subscriptions');
    final items = response is List<dynamic> ? response : const [];
    return items
        .whereType<Map<String, dynamic>>()
        .map(_SubscriptionItem.fromJson)
        .toList(growable: false);
  }

  List<_SubscriptionItem> _visibleItems(List<_SubscriptionItem> items) {
    return items
        .where((item) {
          final matchesFilter = _filter == 'الكل' || item.status == _filter;
          final query = _query.trim();
          return matchesFilter &&
              (query.isEmpty ||
                  item.playerName.contains(query) ||
                  item.playerId.contains(query));
        })
        .toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Iconsax.arrow_right_3),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('إدارة الاشتراكات'),
        ),
        body: FutureBuilder<List<_SubscriptionItem>>(
          future: _subscriptionsFuture,
          builder: (context, snapshot) {
            final allItems = snapshot.data ?? const <_SubscriptionItem>[];
            final items = _visibleItems(allItems);
            final activeCount = allItems
                .where((item) => item.status == 'نشط')
                .length;
            final expiredCount = allItems
                .where((item) => item.status == 'منتهي')
                .length;
            final expiringCount = allItems
                .where((item) => item.isExpiringSoon)
                .length;

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Column(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final compact = constraints.maxWidth < 560;
                            final cards = [
                              _SummaryCard(
                                'الاشتراكات النشطة',
                                '$activeCount',
                                Iconsax.card,
                                AppColors.accentBlue,
                              ),
                              _SummaryCard(
                                'تنتهي قريبًا',
                                '$expiringCount',
                                Iconsax.timer_1,
                                AppColors.orange,
                              ),
                              _SummaryCard(
                                'اشتراكات منتهية',
                                '$expiredCount',
                                Iconsax.close_circle,
                                AppColors.red,
                              ),
                            ];
                            return compact
                                ? Row(children: _withSpacing(cards, 8))
                                : Row(children: _withSpacing(cards, 12));
                          },
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          onChanged: (value) => setState(() => _query = value),
                          decoration: const InputDecoration(
                            hintText: 'ابحث باسم اللاعب أو الكود...',
                            prefixIcon: Icon(Iconsax.search_normal),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Wrap(
                            spacing: 8,
                            children: ['الكل', 'نشط', 'منتهي'].map((filter) {
                              return ChoiceChip(
                                label: Text(filter),
                                selected: _filter == filter,
                                showCheckmark: false,
                                onSelected: (_) =>
                                    setState(() => _filter = filter),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
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
                    child: _SubscriptionsMessage(
                      title: 'تعذر تحميل الاشتراكات',
                      message: snapshot.error is ApiException
                          ? (snapshot.error! as ApiException).message
                          : 'حدث خطأ غير متوقع أثناء الاتصال بالخادم.',
                      onRetry: () {
                        setState(() {
                          _subscriptionsFuture = _loadSubscriptions();
                        });
                      },
                    ),
                  )
                else if (items.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: _SubscriptionsMessage(
                      title: 'لا توجد اشتراكات',
                      message: 'لم يتم تسجيل اشتراكات مطابقة حتى الآن.',
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final active = item.status == 'نشط';
                        return AppSurfaceCard(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: active
                                    ? AppColors.accentBlueSoft
                                    : AppColors.orangeSoft,
                                child: Icon(
                                  Iconsax.card,
                                  color: active
                                      ? AppColors.accentBlue
                                      : AppColors.orange,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.playerName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      '${item.playerId}  •  ${item.endDateLabel}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${item.amount.toStringAsFixed(0)} جنيه',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: item.player == null
                                        ? null
                                        : () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  NewSubscriptionPage(
                                                    player: item.player!,
                                                  ),
                                            ),
                                          ),
                                    child: Text(active ? 'تجديد' : 'تفعيل'),
                                  ),
                                ],
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

  List<Widget> _withSpacing(List<Widget> widgets, double spacing) {
    return [
      for (var index = 0; index < widgets.length; index++) ...[
        Expanded(child: widgets[index]),
        if (index != widgets.length - 1) SizedBox(width: spacing),
      ],
    ];
  }
}

class _SubscriptionItem {
  const _SubscriptionItem({
    required this.playerName,
    required this.playerId,
    required this.amount,
    required this.endDate,
    required this.status,
    required this.player,
  });

  factory _SubscriptionItem.fromJson(Map<String, dynamic> json) {
    final playerJson = json['player'];
    final player = playerJson is Map<String, dynamic>
        ? PlayerSummary.fromJson(playerJson)
        : null;
    final endDate = DateTime.tryParse(json['endDate']?.toString() ?? '');
    final now = DateTime.now();
    final status = endDate != null && endDate.isBefore(now) ? 'منتهي' : 'نشط';

    return _SubscriptionItem(
      playerName: player?.name ?? '',
      playerId: player?.id ?? json['playerId']?.toString() ?? '',
      amount: double.tryParse(json['amount']?.toString() ?? '') ?? 0,
      endDate: endDate,
      status: status,
      player: player,
    );
  }

  final String playerName;
  final String playerId;
  final double amount;
  final DateTime? endDate;
  final String status;
  final PlayerSummary? player;

  bool get isExpiringSoon {
    if (endDate == null || status == 'منتهي') {
      return false;
    }
    final diff = endDate!.difference(DateTime.now()).inDays;
    return diff >= 0 && diff <= 7;
  }

  String get endDateLabel {
    if (endDate == null) {
      return 'بدون تاريخ انتهاء';
    }
    if (isExpiringSoon) {
      return 'ينتهي خلال ${endDate!.difference(DateTime.now()).inDays + 1} أيام';
    }
    return '${endDate!.day.toString().padLeft(2, '0')}/'
        '${endDate!.month.toString().padLeft(2, '0')}/'
        '${endDate!.year}';
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard(this.label, this.value, this.icon, this.color);
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SubscriptionsMessage extends StatelessWidget {
  const _SubscriptionsMessage({
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
            const Icon(Iconsax.card, color: AppColors.mutedText, size: 42),
            const SizedBox(height: 14),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
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
