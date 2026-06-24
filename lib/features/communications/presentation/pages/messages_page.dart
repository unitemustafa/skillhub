import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/core/sync/sync_service.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_back_button.dart';
import 'package:skillhub/core/utils/snackbar_utils.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/communications/data/messages_repository.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key, this.player, this.initialTemplate});

  final PlayerSummary? player;
  final String? initialTemplate;

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final _repository = MessagesRepository();
  final _sessionService = SessionService();
  final _syncService = SyncService();
  late final TextEditingController _messageController;
  String _channel = 'whatsapp';
  bool _schedule = false;
  bool _isSending = false;
  late Future<List<_MessageHistoryItem>> _historyFuture;

  static const _templates = {
    'تذكير بالاشتراك':
        'نذكركم بموعد تجديد اشتراك اللاعب. يرجى التواصل مع إدارة الأكاديمية لإتمام التجديد.',
    'انتهاء الاشتراك':
        'اشتراك اللاعب أوشك على الانتهاء. يسعدنا استمراركم معنا وتجديد الاشتراك.',
    'نتيجة التقييم':
        'تم تسجيل تقييم جديد للاعب ويمكنكم مراجعة النتائج مع المدرب.',
    'موعد التدريب':
        'نذكركم بموعد التدريب القادم. نرجو الحضور قبل الموعد بـ 15 دقيقة.',
  };

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController(
      text: _templates[widget.initialTemplate] ?? '',
    );
    _historyFuture = _loadHistory();
    _syncInBackground();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<List<_MessageHistoryItem>> _loadHistory() async {
    final session = await _sessionService.readLastSession();
    if (session == null || session.isExpired) {
      return const [];
    }
    final items = await _repository.listMessages(session);
    return items.map(_MessageHistoryItem.fromJson).toList(growable: false);
  }

  Future<void> _syncInBackground() async {
    try {
      await _syncService.syncNow();
      if (!mounted) return;
      setState(() {
        _historyFuture = _loadHistory();
      });
    } catch (_) {
      // Offline-first: local messages remain available.
    }
  }

  Future<void> _send() async {
    final body = _messageController.text.trim();
    final recipient = widget.player?.phone ?? '';
    if (body.isEmpty) {
      SnackbarUtils.showError(context, 'اكتب نص الرسالة أولًا');
      return;
    }
    if (recipient.length < 5) {
      SnackbarUtils.showError(context, 'لا يوجد رقم مستلم صالح');
      return;
    }

    setState(() => _isSending = true);
    try {
      final session = await _sessionService.readLastSession();
      if (session == null || session.isExpired) {
        throw Exception(
          'يلزم تسجيل الدخول عبر الإنترنت أولًا قبل استخدام الوضع المحلي.',
        );
      }
      await _repository.createMessage(session, widget.player, {
        'playerId': widget.player?.id,
        'recipient': recipient,
        'channel': _channel,
        'body': body,
        'scheduledAt': _schedule
            ? DateTime.now().add(const Duration(days: 1)).toIso8601String()
            : null,
      });
      if (!mounted) return;
      SnackbarUtils.showSuccess(
        context,
        _schedule ? 'تمت جدولة الرسالة' : 'تم إرسال الرسالة بنجاح',
      );
      setState(() {
        _historyFuture = _loadHistory();
      });
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString(), textAlign: TextAlign.center),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isSending = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButton(),
          title: const Text('الرسائل والتذكيرات'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (widget.player != null) ...[
                    AppSurfaceCard(
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColors.accentBlueSoft,
                            child: Icon(
                              Iconsax.user,
                              color: AppColors.accentBlue,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.player!.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'إرسال إلى ولي الأمر • ${widget.player!.phone}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Iconsax.tick_circle,
                            color: AppColors.green,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  const Text(
                    'قالب الرسالة',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _templates.keys
                          .map(
                            (title) => Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: ActionChip(
                                avatar: const Icon(
                                  Iconsax.message_text,
                                  size: 16,
                                ),
                                label: Text(title),
                                onPressed: () => setState(
                                  () => _messageController.text =
                                      _templates[title]!,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppSurfaceCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'نص الرسالة',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _messageController,
                          minLines: 5,
                          maxLines: 8,
                          maxLength: 500,
                          decoration: const InputDecoration(
                            hintText: 'اكتب الرسالة هنا...',
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'قناة الإرسال',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        SegmentedButton<String>(
                          segments: const [
                            ButtonSegment(
                              value: 'whatsapp',
                              label: Text('واتساب'),
                              icon: Icon(Icons.chat, size: 17),
                            ),
                            ButtonSegment(
                              value: 'sms',
                              label: Text('SMS'),
                              icon: Icon(Iconsax.message, size: 17),
                            ),
                          ],
                          selected: {_channel},
                          onSelectionChanged: (value) =>
                              setState(() => _channel = value.first),
                        ),
                        const SizedBox(height: 12),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            'جدولة الإرسال',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            _schedule
                                ? 'غدًا، نفس الوقت'
                                : 'إرسال الرسالة الآن',
                          ),
                          value: _schedule,
                          onChanged: (value) =>
                              setState(() => _schedule = value),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: _isSending ? null : _send,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentBlue,
                        disabledBackgroundColor: AppColors.accentBlue
                            .withValues(alpha: 0.65),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: _isSending
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Icon(
                              _schedule ? Iconsax.clock : Iconsax.send_1,
                              color: Colors.white,
                            ),
                      label: Text(
                        _schedule ? 'جدولة الرسالة' : 'إرسال عبر $_channel',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'آخر الرسائل',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  FutureBuilder<List<_MessageHistoryItem>>(
                    future: _historyFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final items = snapshot.data ?? const [];
                      if (items.isEmpty) {
                        return const AppSurfaceCard(
                          child: Text(
                            'لا توجد رسائل مسجلة حتى الآن',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                        );
                      }
                      return Column(
                        children: [
                          for (final item in items.take(5)) ...[
                            _MessageHistoryTile(item: item),
                            const SizedBox(height: 10),
                          ],
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageHistoryItem {
  const _MessageHistoryItem({
    required this.title,
    required this.recipient,
    required this.date,
    required this.status,
  });

  factory _MessageHistoryItem.fromJson(Map<String, dynamic> json) {
    final createdAt = DateTime.tryParse(json['createdAt']?.toString() ?? '');
    final player = json['player'];
    final playerName = player is Map<String, dynamic>
        ? player['name']?.toString()
        : null;
    return _MessageHistoryItem(
      title: json['body']?.toString() ?? '',
      recipient: playerName ?? json['recipient']?.toString() ?? '',
      date: createdAt == null
          ? ''
          : '${createdAt.day.toString().padLeft(2, '0')}/'
                '${createdAt.month.toString().padLeft(2, '0')}/'
                '${createdAt.year}',
      status: json['status']?.toString() ?? '',
    );
  }

  final String title;
  final String recipient;
  final String date;
  final String status;
}

class _MessageHistoryTile extends StatelessWidget {
  const _MessageHistoryTile({required this.item});

  final _MessageHistoryItem item;

  @override
  Widget build(BuildContext context) => AppSurfaceCard(
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.green.withValues(alpha: 0.12),
          child: const Icon(
            Iconsax.message_tick,
            color: AppColors.green,
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                item.recipient,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              item.date,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              item.status == 'scheduled' ? 'مجدولة' : 'تم الإرسال',
              style: const TextStyle(fontSize: 11, color: AppColors.green),
            ),
          ],
        ),
      ],
    ),
  );
}
