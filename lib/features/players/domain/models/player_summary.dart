class PlayerSummary {
  const PlayerSummary({
    required this.id,
    required this.name,
    required this.ageLabel,
    required this.phone,
    this.isActive = false,
    this.birthDate,
    this.guardianName,
    this.guardianRelation,
    this.guardianJob,
  });

  final String id;
  final String name;
  final String ageLabel;
  final String phone;
  final bool isActive;
  final String? birthDate;
  final String? guardianName;
  final String? guardianRelation;
  final String? guardianJob;

  factory PlayerSummary.fromJson(Map<String, dynamic> json) {
    final birthDate = _parseDate(json['birthDate']);
    return PlayerSummary(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      ageLabel: birthDate == null ? '' : '${_calculateAge(birthDate)} سنة',
      phone: json['phone']?.toString() ?? '',
      isActive: json['isActive'] == true,
      birthDate: birthDate == null ? null : _formatDate(birthDate),
      guardianName: json['guardianName']?.toString(),
      guardianRelation: json['guardianRelation']?.toString(),
      guardianJob: json['guardianJob']?.toString(),
    );
  }

  Map<String, dynamic> toApiBody() {
    return {
      'name': name,
      'birthDate': _dateToIso(birthDate),
      'phone': phone,
      'guardianName': guardianName,
      'guardianRelation': guardianRelation,
      'guardianJob': guardianJob,
      'isActive': isActive,
    };
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) {
      return null;
    }
    return DateTime.tryParse(value.toString());
  }

  static int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    var age = now.year - birthDate.year;
    final birthdayPassed =
        now.month > birthDate.month ||
        (now.month == birthDate.month && now.day >= birthDate.day);
    if (!birthdayPassed) {
      age--;
    }
    return age;
  }

  static String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  static String? _dateToIso(String? date) {
    if (date == null || date.trim().isEmpty) {
      return null;
    }
    final parts = date.split('/');
    if (parts.length != 3) {
      return date;
    }
    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);
    if (day == null || month == null || year == null) {
      return date;
    }
    return DateTime(year, month, day).toIso8601String();
  }
}
