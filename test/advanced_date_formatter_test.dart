import 'package:advanced_date_formatter/advanced_date_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  test('format method', () {
    final date = DateTime(2024, 12, 30, 14, 45, 20);
    final formatted = AdvancedDateFormatter.format(date: date, format: 'dd/MM/yyyy HH:mm');
    expect(formatted, '30/12/2024 14:45');
  });

  test('timeAgo method', () {
    final date = DateTime.now().subtract(Duration(days: 1));
    final timeAgo = AdvancedDateFormatter.timeAgo(date: date);
    expect(timeAgo, '1 gün önce');
  });
}
