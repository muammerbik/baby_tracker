
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileHandler {
  Future<String?> saveFileToPhoneMemory(String fileName, List<int> fileBytes) async {
    try {
      // Telefonun dökümanlar dizini alınıyor
      Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();

      // Kaydedilecek dosyanın tam yolu oluşturuluyor
      String filePath = "${appDocumentsDirectory.path}/$fileName";

      // Dosya oluşturulup veriler yazılıyor
      File file = File(filePath);
      await file.writeAsBytes(fileBytes);

      // Dosyanın tam yolu geri döndürülüyor
      return filePath;
    } catch (e) {
      // Hata durumunda null döndürülebilir veya hata yönetimi yapılabilir
      print("Dosya kaydetme hatası: $e");
      return null;
    }
  }
}
