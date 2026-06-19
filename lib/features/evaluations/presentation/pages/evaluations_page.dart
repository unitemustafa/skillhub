import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/network/api_exception.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/evaluations/domain/models/evaluation_record.dart';
import 'package:skillhub/features/evaluations/presentation/pages/evaluation_details_page.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:skillhub/features/players/presentation/pages/new_evaluation_page.dart';

class EvaluationsPage extends StatefulWidget {
  const EvaluationsPage({super.key, required this.player});
  final PlayerSummary player;

  @override
  State<EvaluationsPage> createState() => _EvaluationsPageState();
}

class _EvaluationsPageState extends State<EvaluationsPage> {
  final _apiClient = ApiClient();
  String _period = 'الكل';
  late Future<List<EvaluationRecord>> _recordsFuture;

  @override
  void initState() {
    super.initState();
    _recordsFuture = _loadRecords();
  }

  Future<List<EvaluationRecord>> _loadRecords() async {
    final response = await _apiClient.get(
      '/evaluations',
      query: {'playerId': widget.player.id},
    );
    final items = response is List<dynamic> ? response : const [];
    return items
        .whereType<Map<String, dynamic>>()
        .map(EvaluationRecord.fromJson)
        .toList(growable: false);
  }

  List<EvaluationRecord> _visibleRecords(List<EvaluationRecord> records) {
    return records
        .where((record) {
          return _period == 'الكل' || record.date.endsWith(_period);
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
          title: Column(
            children: [
              const Text('سجل التقييمات'),
              Text(
                widget.player.name,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        body: FutureBuilder<List<EvaluationRecord>>(
          future: _recordsFuture,
          builder: (context, snapshot) {
            final allRecords = snapshot.data ?? const <EvaluationRecord>[];
            final visibleRecords = _visibleRecords(allRecords);
            final average = allRecords.isEmpty
                ? 0.0
                : allRecords
                          .map((record) => record.average)
                          .reduce((a, b) => a + b) /
                      allRecords.length;
            final lastRecordDate = allRecords.isEmpty
                ? 'لا يوجد'
                : allRecords.first.date;

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        AppSurfaceCard(
                          color: AppColors.navy,
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white12,
                                child: Icon(
                                  Iconsax.chart_2,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'متوسط الأداء',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Text(
                                        '${average.toStringAsFixed(1)} / 10',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    'آخر تقييم',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    lastRecordDate,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Wrap(
                            spacing: 8,
                            children: ['الكل', '2026', '2025']
                                .map(
                                  (period) => ChoiceChip(
                                    label: Text(period),
                                    selected: _period == period,
                                    showCheckmark: false,
                                    onSelected: (_) =>
                                        setState(() => _period = period),
                                  ),
                                )
                                .toList(),
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
                    child: _EvaluationMessage(
                      title: 'تعذر تحميل التقييمات',
                      message: snapshot.error is ApiException
                          ? (snapshot.error! as ApiException).message
                          : 'حدث خطأ غير متوقع أثناء الاتصال بالخادم.',
                      onRetry: () {
                        setState(() {
                          _recordsFuture = _loadRecords();
                        });
                      },
                    ),
                  )
                else if (visibleRecords.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: _EvaluationMessage(
                      title: 'لا توجد تقييمات',
                      message: 'لم يتم تسجيل تقييمات لهذا اللاعب حتى الآن.',
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 90),
                    sliver: SliverList.separated(
                      itemCount: visibleRecords.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final record = visibleRecords[index];
                        return AppSurfaceCard(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EvaluationDetailsPage(
                                player: widget.player,
                                record: record,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.accentBlueSoft,
                                child: Text(
                                  record.average.toStringAsFixed(1),
                                  style: const TextStyle(
                                    color: AppColors.accentBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      record.date,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${record.id} • ${record.coach}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Iconsax.arrow_left_2,
                                color: AppColors.mutedText,
                                size: 18,
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
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.accentBlue,
          onPressed: () async {
            final saved = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (_) => NewEvaluationPage(player: widget.player),
              ),
            );
            if (saved == true && mounted) {
              setState(() {
                _recordsFuture = _loadRecords();
              });
            }
          },
          icon: const Icon(Iconsax.add, color: Colors.white),
          label: const Text(
            'تقييم جديد',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class _EvaluationMessage extends StatelessWidget {
  const _EvaluationMessage({
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
            const Icon(Iconsax.chart_2, color: AppColors.mutedText, size: 42),
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
