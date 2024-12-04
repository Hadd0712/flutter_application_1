import '../models/nilai.dart';

class TranskripService {
  static void tampilkanTranskrip(List<Nilai> nilaiList) {
    print("===== Transkrip Nilai =====");
    if (nilaiList.isEmpty) {
      print("Belum ada nilai yang dimasukkan.");
      return;
    }

    for (var nilai in nilaiList) {
      print(
          "- ${nilai.mataKuliah.nama} (${nilai.mataKuliah.kode}): ${nilai.nilai.toStringAsFixed(2)}");
    }
  }
}
