import 'dart:io';
import 'models/mahasiswa.dart';
import 'models/mata_kuliah.dart';
import 'models/nilai.dart';
import 'services/transkrip_service.dart';

void main() {
  final mahasiswa = Mahasiswa(nim: "12345", nama: "Budi", semester: 3);

  final List<MataKuliah> mataKuliahList = [
    MataKuliah(kode: "MK001", nama: "Pemrograman", sks: 3),
    MataKuliah(kode: "MK002", nama: "Kalkulus", sks: 4),
    MataKuliah(kode: "MK003", nama: "Basis Data", sks: 3),
  ];

  final List<Nilai> nilaiMahasiswa = [];

  while (true) {
    print("\n===== Sistem Akademik Sederhana =====");
    print("1. Input Nilai Mahasiswa");
    print("2. Hitung IPK");
    print("3. Cetak KRS");
    print("4. Transkrip Nilai");
    print("5. Keluar");
    stdout.write("Pilih menu (1-5): ");
    final input = stdin.readLineSync();

    switch (input) {
      case "1":
        print("\n===== Input Nilai Mahasiswa =====");
        for (var mk in mataKuliahList) {
          stdout.write(
              "Masukkan nilai untuk mata kuliah ${mk.nama} (${mk.kode}): ");
          final nilaiInput = stdin.readLineSync();
          final nilai = double.tryParse(nilaiInput ?? "0") ?? 0.0;
          nilaiMahasiswa.add(Nilai(mataKuliah: mk, nilai: nilai));
        }
        print("\nNilai berhasil dimasukkan!");
        break;

      case "2":
        print("\n===== Hitung IPK =====");
        if (nilaiMahasiswa.isEmpty) {
          print("Belum ada nilai yang dimasukkan.");
        } else {
          final ipk = IPKCalculator.hitungIPK(nilaiMahasiswa);
          if (ipk != null) {
            print("IPK Anda: ${ipk.toStringAsFixed(2)}");
          } else {
            print("Gagal menghitung IPK.");
          }
        }
        break;

      case "3":
        print("\n===== Cetak KRS =====");
        print("Mahasiswa: ${mahasiswa.nama} (${mahasiswa.nim})");
        print("Semester: ${mahasiswa.semester}");
        print("Mata Kuliah yang diambil:");
        for (var mk in mataKuliahList) {
          print("- ${mk.nama} (${mk.kode}) - ${mk.sks} SKS");
        }
        break;

      case "4":
        TranskripService.tampilkanTranskrip(nilaiMahasiswa);
        break;

      case "5":
        print("Terima kasih telah menggunakan sistem akademik!");
        exit(0);

      default:
        print("Pilihan tidak valid. Silakan coba lagi.");
        break;
    }
  }
}

class IPKCalculator {
  static double? hitungIPK(List<Nilai> nilaiMahasiswa) {
    if (nilaiMahasiswa.isEmpty) {
      return null;
    }

    double totalNilai = 0.0;
    int totalSKS = 0;

    for (var nilai in nilaiMahasiswa) {
      totalNilai += nilai.nilai * nilai.mataKuliah.sks;
      totalSKS += nilai.mataKuliah.sks;
    }

    return totalSKS > 0 ? totalNilai / totalSKS : null;
  }
}
