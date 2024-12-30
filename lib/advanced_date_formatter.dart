library advanced_date_formatter;

class AdvancedDateFormatter {
  /// Verilen DateTime'i özel bir formatta döner
  static String format({
  required DateTime date,
  String format = 'yyyy-MM-dd HH:mm:ss',
}) {
  final buffer = StringBuffer();

  // Grup bazlı analiz için bir harita
  final formatMap = {
    'yyyy': date.year.toString(),
    'MM': date.month.toString().padLeft(2, '0'),
    'dd': date.day.toString().padLeft(2, '0'),
    'HH': date.hour.toString().padLeft(2, '0'),
    'mm': date.minute.toString().padLeft(2, '0'),
    'ss': date.second.toString().padLeft(2, '0'),
  };

  // Format string'inde grup araması yap
  final regex = RegExp(r'(yyyy|MM|dd|HH|mm|ss)');
  String tempFormat = format;

  // Her grubu sırayla değiştir
  for (final match in regex.allMatches(format)) {
    final group = match.group(0)!;
    tempFormat = tempFormat.replaceFirst(group, formatMap[group]!);
  }

  buffer.write(tempFormat);
  return buffer.toString();
}

  /// Tarih farkını insan okunabilir bir formata çevir
  static String timeAgo({required DateTime date, DateTime? referenceDate}) {
    referenceDate ??= DateTime.now();
    final duration = referenceDate.difference(date);

    if (duration.inDays >= 365) {
      return '${duration.inDays ~/ 365} yıl önce';
    } else if (duration.inDays >= 30) {
      return '${duration.inDays ~/ 30} ay önce';
    } else if (duration.inDays >= 1) {
      return '${duration.inDays} gün önce';
    } else if (duration.inHours >= 1) {
      return '${duration.inHours} saat önce';
    } else if (duration.inMinutes >= 1) {
      return '${duration.inMinutes} dakika önce';
    } else {
      return 'şimdi';
    }
  }

  static String getDayName(DateTime date, {String locale = 'en'}) {
  const daysTR = ['Pazar', 'Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi'];
  const daysEN = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  
  final dayIndex = date.weekday % 7; // Haftanın günü (0 = Pazar)
  if (locale == 'tr') {
    return daysTR[dayIndex];
  } else {
    return daysEN[dayIndex];
  }
}

}
