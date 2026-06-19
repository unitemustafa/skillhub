class EvaluationRecord {
  const EvaluationRecord({
    required this.id,
    required this.date,
    required this.coach,
    required this.scores,
    required this.notes,
  });

  final String id;
  final String date;
  final String coach;
  final Map<String, int> scores;
  final String notes;

  double get average => scores.values.reduce((a, b) => a + b) / scores.length;

  factory EvaluationRecord.fromJson(Map<String, dynamic> json) {
    final date = DateTime.tryParse(json['evaluationDate']?.toString() ?? '');
    return EvaluationRecord(
      id: json['id']?.toString() ?? '',
      date: date == null
          ? ''
          : '${date.day.toString().padLeft(2, '0')}/'
                '${date.month.toString().padLeft(2, '0')}/'
                '${date.year}',
      coach: json['coach']?.toString() ?? '',
      scores: {
        'اللياقة': _score(json['fitness']),
        'السرعة': _score(json['speed']),
        'المهارة': _score(json['skill']),
        'الالتزام': _score(json['discipline']),
        'العمل الجماعي': _score(json['teamwork']),
      },
      notes: json['notes']?.toString() ?? '',
    );
  }

  static int _score(dynamic value) {
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}
