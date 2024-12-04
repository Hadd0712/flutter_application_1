import 'package:flutter/material.dart';
import '../models/mahasiswa.dart';
import '../models/mata_kuliah.dart';

class KRSScreen extends StatelessWidget {
  final Mahasiswa mahasiswa = Mahasiswa(nim: '12345', nama: 'Budi', semester: 3);
  final List<MataKuliah> mataKuliah = [
    MataKuliah(kode: 'MK001', nama: 'Pemrograman', sks: 3),
    MataKuliah(kode: 'MK002', nama: 'Kalkulus', sks: 4),
    MataKuliah(kode: 'MK003', nama: 'Basis Data', sks: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cetak KRS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mahasiswa: ${mahasiswa.nama} (${mahasiswa.nim})', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Semester: ${mahasiswa.semester}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Mata Kuliah:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...mataKuliah.map((mk) => Text('- ${mk.nama} (${mk.sks} SKS)')),
          ],
        ),
      ),
    );
  }
}
