import 'package:flutter/material.dart';

class InformasiContent extends StatelessWidget {
  const InformasiContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 10,
        horizontalMargin: 10,
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Rumah Sakit',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'RS Universitas Indonesia',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'RSCM Kencana',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'RS Fatmawati',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'RSPAD Gatot Soebroto',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Alamat',
                  style: TextStyle(fontWeight: FontWeight.bold))),
              DataCell(Text(
                  'Jl. Prof. DR. Bahder Djohan, Kel. Pondok Cina, \nKec. Beji, Kota Depok, Jawa Barat 16424')),
              DataCell(Text(
                  'Jl. Pangeran Diponegoro, Kel. Kenari, \nKec. Senen, Kota Jakarta Pusat, 10430')),
              DataCell(Text(
                  'Jl. RS. Fatmawati Raya, Kel. Cilandak Barat, \nKec. Cilandak, Kota Jakarta Selatan, 12430')),
              DataCell(Text(
                  'Jl. Kwini, Kel. Senen, \nKec. Senen, Kota Jakarta Pusat, 10410')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Hotline Whatsapp',
                  style: TextStyle(fontWeight: FontWeight.bold))),
              DataCell(Text('+62 812-1060-4285')),
              DataCell(Text('+62 838-7910-4969')),
              DataCell(Text('+62 821-9999-0650')),
              DataCell(Text('+62 815-1310-1310')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Maksimal pelaksanaan \nasesmen',
                  style: TextStyle(fontWeight: FontWeight.bold))),
              DataCell(Text('30 Juli 2024')),
              DataCell(Text('26 Juli 2024')),
              DataCell(Text('30 Juli 2024')),
              DataCell(Text('1 Agustus 2024')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Estimasi waktu \npelaksanaan',
                  style: TextStyle(fontWeight: FontWeight.bold))),
              DataCell(Text('08.00 selesai (minimal 4 jam)')),
              DataCell(Text('07.30 selesai (minimal 4 jam)')),
              DataCell(Text('08.00 selesai (minimal 4 jam)')),
              DataCell(Text('07.00 selesai (minimal 4 jam)')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Estimasi hasil \nasesmen selesai',
                  style: TextStyle(fontWeight: FontWeight.bold))),
              DataCell(Text('3 hari kerja')),
              DataCell(Text('3 hari kerja')),
              DataCell(Text('1 hari kerja')),
              DataCell(Text('1 hari kerja')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Pemeriksaan yang \ndikerjakan',
                  style: TextStyle(fontWeight: FontWeight.bold))),
              DataCell(Text(
                  'Lab/Rontgen/Urine utk \nNAPZA/MMPI/Wawancara dengan Psikiater')),
              DataCell(Text(
                  'Lab/Rontgen/Urine utk \nNAPZA/MMPI/Wawancara dengan Psikiater')),
              DataCell(Text(
                  'Lab/Rontgen/Urine utk \nNAPZA/MMPI/Wawancara dengan Psikiater')),
              DataCell(Text(
                  'Lab/Rontgen/Urine utk \nNAPZA/MMPI/Wawancara dengan Psikiater')),
            ],
          ),
        ],
      ),
    );
  }
}
