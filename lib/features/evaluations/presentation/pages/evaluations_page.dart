import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/network/api_exception.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_blue_page_header.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/evaluations/domain/models/evaluation_record.dart';
import 'package:skillhub/features/evaluations/presentation/pages/evaluation_details_page.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:skillhub/features/players/presentation/pages/new_evaluation_page.dart';

class EvaluationsPage extends StatefulWidget {
  const EvaluationsPage({super.key, this.player});

  final PlayerSummary? player;

  @override
  State<EvaluationsPage> createState() => _EvaluationsPageState();
}

class _EvaluationsPageState extends State<EvaluationsPage> {
  final _apiClient = ApiClient();
  String _period = 'الكل';
  late Future<List<EvaluationRecord>> _recordsFuture;

  bool get _isPlayerScope => widget.player != null;

  @override
  void initState() {
    super.initState();
    _recordsFuture = _loadRecords();
  }

  Future<List<EvaluationRecord>> _loadRecords() async {
    final response = await _apiClient.get(
      '/evaluations',
      query: _isPlayerScope ? {'playerId': widget.player!.id} : null,
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

  List<String> _periods(List<EvaluationRecord> records) {
    final years =
        records
            .map((record) => record.date.split('/').last)
            .where((year) => year.length == 4)
            .toSet()
            .toList()
          ..sort((a, b) => b.compareTo(a));
    return ['الكل', ...years.take(4)];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
            final excellentCount = allRecords
                .where((record) => record.average >= 8)
                .length;
            final periods = _periods(allRecords);

            return CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                AppBluePageHeader(
                  title: _isPlayerScope ? 'سجل التقييمات' : 'التقييمات',
                  pinned: true,
                  floating: false,
                  snap: false,
                  bottomHeight: 56,
                  bottom: Text(
                    _isPlayerScope
                        ? widget.player!.name
                        : 'متابعة أداء اللاعبين ومستوى التطور',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white.withValues(alpha: 0.82),
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _EvaluationSummaryCard(
                          average: average,
                          total: allRecords.length,
                          excellent: excellentCount,
                        ),
                        const SizedBox(height: 12),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (final period in periods)
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: ChoiceChip(
                                    label: Text(period),
                                    selected: _period == period,
                                    showCheckmark: false,
                                    onSelected: (_) =>
                                        setState(() => _period = period),
                                  ),
                                ),
                            ],
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
                      message: 'لم يتم تسجيل تقييمات مطابقة حتى الآن.',
                    ),
                  )
                else
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      0,
                      16,
                      _isPlayerScope ? 90 : 24,
                    ),
                    sliver: SliverList.separated(
                      itemCount: visibleRecords.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final record = visibleRecords[index];
                        final player = widget.player ?? record.player;
                        return _EvaluationRecordCard(
                          record: record,
                          playerName: player?.name,
                          onTap: player == null
                              ? null
                              : () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EvaluationDetailsPage(
                                      player: player,
                                      record: record,
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
        floatingActionButton: _isPlayerScope
            ? FloatingActionButton.extended(
                backgroundColor: AppColors.accentBlue,
                onPressed: () async {
                  final saved = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewEvaluationPage(player: widget.player!),
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
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

class _EvaluationSummaryCard extends StatelessWidget {
  const _EvaluationSummaryCard({
    required this.average,
    required this.total,
    required this.excellent,
  });

  final double average;
  final int total;
  final int excellent;

  @override
  Widget build(BuildContext context) {
    return AppSurfaceCard(
      color: AppColors.navy,
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  average.toStringAsFixed(1),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'متوسط الأداء',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                SizedBox(height: 4),
                Text(
                  'نظرة عامة على آخر تقييمات اللاعبين',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _SummaryMetric(label: 'التقييمات', value: '$total'),
              const SizedBox(height: 8),
              _SummaryMetric(label: 'ممتاز', value: '$excellent'),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryMetric extends StatelessWidget {
  const _SummaryMetric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 11),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class _EvaluationRecordCard extends StatelessWidget {
  const _EvaluationRecordCard({
    required this.record,
    required this.playerName,
    this.onTap,
  });

  final EvaluationRecord record;
  final String? playerName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppSurfaceCard(
      onTap: onTap,
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
                  playerName?.isNotEmpty == true ? playerName! : record.date,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                Text(
                  '${record.date}  •  ${record.coach.isEmpty ? 'بدون مدرب' : record.coach}',
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
