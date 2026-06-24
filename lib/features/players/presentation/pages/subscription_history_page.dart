import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_back_button.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/subscriptions/data/subscriptions_repository.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:skillhub/features/players/presentation/pages/new_subscription_page.dart';

class SubscriptionHistoryPage extends StatefulWidget {
  const SubscriptionHistoryPage({super.key, required this.player});

  final PlayerSummary player;

  @override
  State<SubscriptionHistoryPage> createState() =>
      _SubscriptionHistoryPageState();
}

class _SubscriptionHistoryPageState extends State<SubscriptionHistoryPage> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['الكل', 'نشط', 'منتهي'];
  final _repository = SubscriptionsRepository();
  final _sessionService = SessionService();
  late Future<List<Map<String, dynamic>>> _subscriptionsFuture;

  @override
  void initState() {
    super.initState();
    _subscriptionsFuture = _loadSubscriptions();
  }

  Future<List<Map<String, dynamic>>> _loadSubscriptions() async {
    final session = await _sessionService.readLastSession();
    if (session == null || session.isExpired) {
      return const [];
    }
    final items = await _repository.listSubscriptions(
      session,
      playerId: widget.player.id,
    );
    return items.where(_matchesSelectedTab).toList(growable: false);
  }

  bool _matchesSelectedTab(Map<String, dynamic> item) {
    if (_selectedTabIndex == 0) {
      return true;
    }
    final endDate = DateTime.tryParse(item['endDate']?.toString() ?? '');
    final isActive = endDate != null && !endDate.isBefore(DateTime.now());
    return _selectedTabIndex == 1 ? isActive : !isActive;
  }

  void _refresh() {
    setState(() {
      _subscriptionsFuture = _loadSubscriptions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: const AppBackButton(),
          title: Column(
            children: [
              Text(
                'سجل الاشتراكات',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                widget.player.name,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_tabs.length, (index) {
                  final isSelected = _selectedTabIndex == index;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                          _subscriptionsFuture = _loadSubscriptions();
                        });
                      },
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.accentBlue
                              : AppColors.background,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          _tabs[index],
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.white
                                : AppColors.textSecondary,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _subscriptionsFuture,
                builder: (context, snapshot) {
                  final subscriptions =
                      snapshot.data ?? const <Map<String, dynamic>>[];
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (subscriptions.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Text(
                          'لا توجد اشتراكات لهذا اللاعب حتى الآن',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                      ),
                    );
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: subscriptions.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return _SubscriptionCard(item: subscriptions[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final saved = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NewSubscriptionPage(player: widget.player),
                    ),
                  );
                  if (saved == true && mounted) {
                    _refresh();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navy,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Iconsax.refresh, color: AppColors.white),
                label: const Text(
                  'تجديد الاشتراك',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SubscriptionCard extends StatelessWidget {
  const _SubscriptionCard({required this.item});

  final Map<String, dynamic> item;

  bool get _isActive {
    final endDate = DateTime.tryParse(item['endDate']?.toString() ?? '');
    return endDate != null && !endDate.isBefore(DateTime.now());
  }

  String _formatAmount() {
    final amount = num.tryParse(item['amount']?.toString() ?? '') ?? 0;
    return '${amount.toStringAsFixed(amount.truncateToDouble() == amount ? 0 : 2)} جنيه';
  }

  String _formatDateRange() {
    final start = DateTime.tryParse(item['startDate']?.toString() ?? '');
    final end = DateTime.tryParse(item['endDate']?.toString() ?? '');
    return '${_formatDate(start)} — ${_formatDate(end)}';
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '-';
    }
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return AppSurfaceCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: (_isActive ? AppColors.green : AppColors.red)
                      .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _isActive ? 'نشط' : 'منتهي',
                  style: TextStyle(
                    color: _isActive ? AppColors.green : AppColors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'اشتراك جديد',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _formatAmount(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(width: 8),
              Icon(Iconsax.money_4, color: AppColors.textSecondary, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _formatDateRange(),
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Iconsax.calendar_1,
                color: AppColors.textSecondary,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
