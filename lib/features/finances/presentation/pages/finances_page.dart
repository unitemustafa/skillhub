import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/network/api_exception.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_blue_page_header.dart';
import 'package:skillhub/core/utils/snackbar_utils.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';

class FinancesPage extends StatefulWidget {
  const FinancesPage({super.key});

  @override
  State<FinancesPage> createState() => _FinancesPageState();
}

class _FinancesPageState extends State<FinancesPage> {
  final _apiClient = ApiClient();
  final _searchController = TextEditingController();
  String _filter = 'الكل';
  String _period = 'هذا الشهر';
  String _query = '';
  late Future<List<_Transaction>> _transactionsFuture;

  @override
  void initState() {
    super.initState();
    _transactionsFuture = _loadTransactions();
  }

  Future<List<_Transaction>> _loadTransactions() async {
    final response = await _apiClient.get('/finance/transactions');
    final items = response is List<dynamic> ? response : const [];
    return items
        .whereType<Map<String, dynamic>>()
        .map(_Transaction.fromJson)
        .toList(growable: false);
  }

  List<_Transaction> _visibleTransactions(List<_Transaction> transactions) {
    final query = _normalizeSearch(_query);
    return transactions
        .where((item) {
          final matchesFilter =
              _filter == 'الكل' ||
              (_filter == 'إيرادات' ? item.income : !item.income);
          final matchesSearch =
              query.isEmpty ||
              _normalizeSearch(item.title).contains(query) ||
              _normalizeSearch(item.category).contains(query) ||
              _normalizeSearch(item.date).contains(query) ||
              item.amount.toStringAsFixed(0).contains(query);
          return matchesFilter && matchesSearch;
        })
        .toList(growable: false);
  }

  String _normalizeSearch(String value) => value.trim().toLowerCase();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: FutureBuilder<List<_Transaction>>(
          future: _transactionsFuture,
          builder: (context, snapshot) {
            final transactions = snapshot.data ?? const <_Transaction>[];
            final visible = _visibleTransactions(transactions);
            final income = transactions
                .where((item) => item.income)
                .fold<double>(0, (sum, item) => sum + item.amount);
            final expenses = transactions
                .where((item) => !item.income)
                .fold<double>(0, (sum, item) => sum + item.amount);

            return CustomScrollView(
              slivers: [
                const AppBluePageHeader(
                  title: 'الإيرادات والمصروفات',
                  showBackButton: true,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppSurfaceCard(
                          color: AppColors.navy,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'صافي الرصيد',
                                style: TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${(income - expenses).toStringAsFixed(0)} جنيه',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final incomeMetric = _MoneyMetric(
                                    'الإيرادات',
                                    income.toStringAsFixed(0),
                                    Iconsax.arrow_up_3,
                                    AppColors.greenBright,
                                  );
                                  final expensesMetric = _MoneyMetric(
                                    'المصروفات',
                                    expenses.toStringAsFixed(0),
                                    Iconsax.arrow_down,
                                    AppColors.orange,
                                  );
                                  if (constraints.maxWidth < 360) {
                                    return Column(
                                      children: [
                                        incomeMetric,
                                        const SizedBox(height: 8),
                                        expensesMetric,
                                      ],
                                    );
                                  }
                                  return Row(
                                    children: [
                                      Expanded(child: incomeMetric),
                                      const SizedBox(width: 12),
                                      Expanded(child: expensesMetric),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _searchController,
                          onChanged: (value) => setState(() => _query = value),
                          decoration: InputDecoration(
                            hintText: 'ابحث في الحركات المالية...',
                            prefixIcon: const Icon(Iconsax.search_normal),
                            suffixIcon: _query.trim().isEmpty
                                ? null
                                : IconButton(
                                    tooltip: 'مسح البحث',
                                    onPressed: () {
                                      _searchController.clear();
                                      setState(() => _query = '');
                                    },
                                    icon: const Icon(Iconsax.close_circle),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final periodField = DropdownButtonFormField<String>(
                              initialValue: _period,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.calendar),
                              ),
                              items: ['هذا الأسبوع', 'هذا الشهر', 'هذه السنة']
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) =>
                                  setState(() => _period = value ?? _period),
                            );
                            final filterButton = PopupMenuButton<String>(
                              initialValue: _filter,
                              onSelected: (value) =>
                                  setState(() => _filter = value),
                              itemBuilder: (_) => ['الكل', 'إيرادات', 'مصروفات']
                                  .map(
                                    (value) => PopupMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                              child: Container(
                                height: 52,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Iconsax.filter, size: 18),
                                    const SizedBox(width: 8),
                                    Text(_filter),
                                  ],
                                ),
                              ),
                            );
                            if (constraints.maxWidth < 430) {
                              return Column(
                                children: [
                                  periodField,
                                  const SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: filterButton,
                                  ),
                                ],
                              );
                            }
                            return Row(
                              children: [
                                Expanded(child: periodField),
                                const SizedBox(width: 10),
                                filterButton,
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 22),
                        Text(
                          'الحركات المالية • $_period',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
                    child: _FinanceMessage(
                      title: 'تعذر تحميل الحركات المالية',
                      message: snapshot.error is ApiException
                          ? (snapshot.error! as ApiException).message
                          : 'حدث خطأ غير متوقع أثناء الاتصال بالخادم.',
                      onRetry: () {
                        setState(() {
                          _transactionsFuture = _loadTransactions();
                        });
                      },
                    ),
                  )
                else if (visible.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: _FinanceMessage(
                      title: 'لا توجد حركات مالية',
                      message: 'لم يتم تسجيل حركات مطابقة حتى الآن.',
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                    sliver: SliverList.separated(
                      itemCount: visible.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) =>
                          _TransactionTile(item: visible[index]),
                    ),
                  ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _showAddTransaction,
          backgroundColor: AppColors.accentBlue,
          icon: const Icon(Iconsax.add, color: Colors.white),
          label: const Text(
            'إضافة حركة',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _showAddTransaction() {
    final pageContext = context;
    final descriptionController = TextEditingController();
    final amountController = TextEditingController();
    var type = 'income';

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) => Directionality(
        textDirection: TextDirection.rtl,
        child: StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                20,
                20,
                MediaQuery.viewInsetsOf(sheetContext).bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'إضافة حركة مالية',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(value: 'income', label: Text('إيراد')),
                      ButtonSegment(value: 'expense', label: Text('مصروف')),
                    ],
                    selected: {type},
                    onSelectionChanged: (values) =>
                        setSheetState(() => type = values.first),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'البيان',
                      prefixIcon: Icon(Iconsax.note),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'المبلغ',
                      prefixIcon: Icon(Iconsax.money),
                    ),
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await _apiClient.post('/finance/transactions', {
                          'type': type,
                          'category': type == 'income' ? 'manual' : 'expense',
                          'amount': amountController.text.trim(),
                          'description': descriptionController.text.trim(),
                        });
                        if (!sheetContext.mounted || !pageContext.mounted) {
                          return;
                        }
                        Navigator.pop(sheetContext);
                        SnackbarUtils.showSuccess(
                          pageContext,
                          'تمت إضافة الحركة المالية',
                        );
                        setState(() {
                          _transactionsFuture = _loadTransactions();
                        });
                      } on ApiException catch (error) {
                        if (!pageContext.mounted) return;
                        ScaffoldMessenger.of(pageContext).showSnackBar(
                          SnackBar(
                            content: Text(
                              error.message,
                              textAlign: TextAlign.center,
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Theme.of(
                              pageContext,
                            ).colorScheme.error,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentBlue,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text(
                      'حفظ الحركة',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Transaction {
  const _Transaction({
    required this.title,
    required this.category,
    required this.amount,
    required this.income,
    required this.date,
  });

  factory _Transaction.fromJson(Map<String, dynamic> json) {
    final occurredAt = DateTime.tryParse(json['occurredAt']?.toString() ?? '');
    return _Transaction(
      title: json['description']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      amount: double.tryParse(json['amount']?.toString() ?? '') ?? 0,
      income: json['type'] == 'income',
      date: occurredAt == null
          ? ''
          : '${occurredAt.day.toString().padLeft(2, '0')}/'
                '${occurredAt.month.toString().padLeft(2, '0')}/'
                '${occurredAt.year}',
    );
  }

  final String title;
  final String category;
  final double amount;
  final bool income;
  final String date;
}

class _MoneyMetric extends StatelessWidget {
  const _MoneyMetric(this.label, this.value, this.icon, this.color);
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.white70, fontSize: 11),
              ),
              Text(
                '$value ج',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({required this.item});
  final _Transaction item;
  @override
  Widget build(BuildContext context) => AppSurfaceCard(
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: (item.income ? AppColors.green : AppColors.red)
              .withValues(alpha: 0.12),
          child: Icon(
            item.income ? Iconsax.arrow_down : Iconsax.arrow_up_3,
            color: item.income ? AppColors.green : AppColors.red,
            size: 19,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${item.category} • ${item.date}',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        Text(
          '${item.income ? '+' : '-'}${item.amount.toStringAsFixed(0)} ج',
          style: TextStyle(
            color: item.income ? AppColors.green : AppColors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

class _FinanceMessage extends StatelessWidget {
  const _FinanceMessage({
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
            const Icon(Iconsax.money, color: AppColors.mutedText, size: 42),
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
