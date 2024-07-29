import 'package:flutter/material.dart';

class TimelineContent extends StatelessWidget {
  const TimelineContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        columnSpacing: 10,
        horizontalMargin: 10,
        columns: const <DataColumn>[
          DataColumn(
            label: Text('No.'),
          ),
          DataColumn(
            label: Text('Kegiatan'),
          ),
          DataColumn(
            label: Text('Mulai'),
          ),
          DataColumn(
            label: Text('Selesai'),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('1.')),
              DataCell(Text('Pendaftaran Anggota P3CR')),
              DataCell(Text('27 Mei 2024')),
              DataCell(Text('5 Juni 2024')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2.')),
              DataCell(Text('Proses Seleksi P3CR oleh Pansus Pilrek')),
              DataCell(Text('6 Juni 2024')),
              DataCell(Text('16 Juni 2024')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('3.')),
              DataCell(Text('Rapat MWA pembentukan dan penetapan Tim P3CR')),
              DataCell(Text('21 Juni 2024')),
              DataCell(Text('21 Juni 2024')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('4.')),
              DataCell(Text('Pertemuan Perdana P3CR dengan Pansus Pilrek')),
              DataCell(Text('24 Juni 2024')),
              DataCell(Text('25 Juni 2024')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('5.')),
              DataCell(Text('Sosialisasi Pilrek oleh Tim P3CR')),
              DataCell(Text('8 Juli 2024')),
              DataCell(Text('3 Agustus 2024')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('6.')),
              DataCell(Text('Masa Pendaftaran Bakal Calon Rektor')),
              DataCell(Text('15 Juli 2024')),
              DataCell(Text('3 Agustus 2024')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('7.')),
              DataCell(Text('Pengecekan Berkas Administrasi')),
              DataCell(Text('5 Agustus 2024')),
              DataCell(Text('7 Agustus 2024')),
            ],
          ),
          DataRow(cells: <DataCell>[
            DataCell(Text('8.')),
            DataCell(Text('Penyampaian Nama Pendaftar Bakal Calon Rektor')),
            DataCell(Text('8 Agustus 2024')),
            DataCell(Text('8 Agustus 2024')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('9.')),
            DataCell(Text('Pengumuman Calon Rektor Terjaring')),
            DataCell(Text('9 Agustus 2024')),
            DataCell(Text('9 Agustus 2024')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('10.')),
            DataCell(Text('Proses Penyaringan 20 Calon Rektor oleh Tim P3CR')),
            DataCell(Text('12 Agustus 2024')),
            DataCell(Text('22 Agustus 2024')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('11.')),
            DataCell(Text('Proses Penyaringan 7 Calon Rektor')),
            DataCell(Text('26 Agustus 2024')),
            DataCell(Text('9 September 2024')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('12.')),
            DataCell(Text('Proses Penyaringan 3 Calon Rektor')),
            DataCell(Text('11 September 2024')),
            DataCell(Text('18 September 2024')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('13.')),
            DataCell(Text('Proses Penyaringan Calon Rektor')),
            DataCell(Text('19 September 2024')),
            DataCell(Text('26 September 2024')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('14.')),
            DataCell(Text('Pengumuman Rektor Terpilih')),
            DataCell(Text('26 September 2024')),
            DataCell(Text('26 September 2024')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('15.')),
            DataCell(Text('Pelantikan dan Pengambilan Sumpah Rektor Terpilih')),
            DataCell(Text('4 Desember 2024')),
            DataCell(Text('4 Desember 2024')),
          ]),
        ],
      ),
    );
  }
}
