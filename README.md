Advanced Date Formatter
Date Formatter Pro, Flutter uygulamaları için tarih ve saatleri kolayca biçimlendirebilmenizi sağlayan güçlü ve esnek bir pakettir. Basit bir API sunar ve yaygın kullanılan tarih formatlarını destekler.

Features
Tarih ve saati özelleştirilmiş formatlarla dönüştürme (örn: dd/MM/yyyy, yyyy-MM-dd HH:mm:ss).
Zaman farkını kullanıcı dostu metinlerle ifade etme (örn: "2 gün önce", "5 saat sonra").
Yerel dil desteği ile çıktı üretme.
Performans optimizasyonu için hafif ve hızlı çalışır.
Getting Started
Gereksinimler
Flutter SDK >=2.0.0
Dart SDK >=2.12.0
Paketi projeye eklemek için pubspec.yaml dosyanıza aşağıdaki satırı ekleyin:


dependencies:
  date_formatter_pro: ^1.0.0
Daha sonra terminalde şu komutu çalıştırın:

flutter pub get
Usage
Tarih ve saatleri özelleştirilmiş formatlarla biçimlendirmek için kullanabileceğiniz örnek:

import 'package:date_formatter_pro/date_formatter_pro.dart';

void main() {
  final date = DateTime(2024, 12, 30, 14, 45);

  // Özel formatta tarih biçimlendirme
  final formattedDate = AdvancedDateFormatter.format(
    date: date,
    format: 'dd/MM/yyyy HH:mm',
  );
  print(formattedDate); // Çıktı: 30/12/2024 14:45

  // Zaman farkını metinsel ifade ile hesaplama
  final timeAgo = AdvancedDateFormatter.timeAgo(
    date: DateTime.now().subtract(Duration(days: 1)),
  );
  print(timeAgo); // Çıktı: 1 gün önce
}
Daha kapsamlı örnekler için /example klasörünü inceleyebilirsiniz.

Additional Information
Bu paketi geliştirmeye katkıda bulunmak veya sorun bildirmek istiyorsanız lütfen GitHub Proje Sayfası'nı ziyaret edin. Geri bildirimleriniz ve önerileriniz bizim için değerlidir.

Katkıda Bulunma
Katkıda bulunmak isteyenler için CONTRIBUTING.md dosyasını okuyun.
Yeni özellik isteklerinizi veya bulduğunuz hataları Issue Tracker üzerinden bildirin.
Lisans
Bu proje MIT Lisansı ile lisanslanmıştır.