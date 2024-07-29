import 'package:flutter/material.dart';

const persyaratanUmumContent = SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("A. Berkewarganegaraan Indonesia"),
      Text("B. Sehat jasmani dan rohani"),
      Text(
          "C. Berpendidikan dan bergelar doktor, doktor terapan atau sub spesialis"),
      Text("D. Memiliki integritas, komitmen, dan kepemimpinan yang tinggi"),
      Text("E. Memiliki kreativitas untuk pengembangan potensi UI"),
      Text("F. Berwawasan luas mengenai pendidikan tinggi"),
      Text(
          "G. Belum berusia 60 (enam puluh) tahun pada saat dilantik menjadi Rektor sesuai dengan jadwal yang telah ditetapkan, yaitu 4 Desember 2024"),
      Text(
          "H. Bukan anggota partai politik atau organisasi yang berafiliasi secara langsung dengan partai politik paling kurang 1 (satu) tahun sebelum pendaftaran"),
      Text(
          "I. Tidak pernah dihukum berdasarkan putusan pengadilan yang berkekuatan hukum tetap"),
      Text(
          "J. Memiliki kematangan pribadi, keterampilan interpersonal, dan kemampuan kerja sama yang baik dengan berbagai pemangku kepentingan"),
    ],
  ),
);

const persyaratanAdminContent = SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("A. Fotokopi Kartu Tanda Penduduk (KTP)"),
      Text("B. Surat keterangan sehat jasmani, surat keterangan bebas narkoba, dan surat keterangan kesehatan jiwa dari salah satu rumah sakit rujukan:"),
      Text("  1. Rumah Sakit Universitas Indonesia"),
      Text("  2. RSUPN Dr. Cipto Mangunkusumo"),
      Text("  3. RSUP Fatmawati"),
      Text("  4. RSPAD Gatot Soebroto"),
      Text("C. Fotokopi akta kelahiran, akta kenal lahir, atau dokumen kelahiran resmi lainnya"),
      Text("D. Fotokopi ijazah doktor, doktor terapan, dan/atau subspesialis yang telah dilegalisir dari perguruan tinggi yang terakreditasi oleh kementerian yang menyelenggarakan urusan di bidang pendidikan atau perguruan tinggi luar negeri yang telah disetarakan oleh kementerian yang menyelenggarakan urusan di bidang pendidikan"),
      Text("E. Fotokopi Nomor Pokok Wajib Pajak (NPWP) dan Surat Pemberitahuan Tahunan (SPT) terakhir"),
      Text("F. Bukti Laporan Harta Kekayaan Penyelenggaraan Negara (LHKPN) untuk Pejabat Negara dan Laporan Harta Kekayaan Aparatur Sipil Negara (LHKASN) untuk Aparatur Sipil Negara"),
      Text("G. Daftar riwayat hidup, termasuk data tentang pekerjaan, pengalaman, pendidikan, dan keluarga yang harus diserahkan dalam 2 (dua) versi uraian ini:"),
      Text("  1. Riwayat hidup lengkap"),
      Text("  2. Executive summary dari riwayat hidup, tidak lebih dari 2 (dua) halaman dengan ketentuan:"),
      Text("    a. Font Arial"),
      Text("    b. Ukuran font 12"),
      Text("    c. Line spacing single"),
      Text("    d. Margin kiri-kanan-atas-bawah dengan urutan sebagai berikut 4-3-3-3 cm"),
      Text("H. Makalah yang menguraikan tentang:"),
      Text("  1. Motivasi calon untuk menjadi Rektor, serta pemikirannya mengenai rencana strategis UI dan program kerjanya berdasarkan visi, misi, kebijakan umum, dan pokok-pokok pengembangan jangka panjang UI"),
      Text("  2. Gambaran diri atau uraian tentang diri sendiri yang harus diserahkan dalam 2 (dua) versi:"),
      Text("    a. Uraian lengkap"),
      Text("    b. Executive summary yang tidak lebih dari 10 (sepuluh) halaman dengan ketentuan:"),
      Text("      i. Font Arial"),
      Text("      ii. Ukuran font 12"),
      Text("      iii. Line spacing single"),
      Text("      iv. Margin kiri-kanan-atas-bawah dengan urutan sebagai berikut 4-3-3-3 cm"),
      Text("I. Video singkat perkenalan diri mengenai visi dan misi yang akan dijalankan apabila  ditetapkan menjadi Rektor Universitas Indonesia dengan durasi maksimal 60 detik."),
      Text("J. Surat pernyataan (Form 1) yang berisi:"),
      Text("  1. Kesediaan menjadi Bakal Calon Rektor Universitas Indonesia;"),
      Text("  2. Kesanggupan untuk menjadi Rektor Universitas Indonesia untuk masa jabatan 2024—2029"),
      Text("  3. Komitmen untuk:"),
      Text("    a. Bekerja penuh waktu"),
      Text("    b. Bersedia dievaluasi secara berkala oleh MWA dalam jabatannya sebagai Rektor"),
      Text("    c. Bersedia untuk mundur atau menerima untuk diberhentikan, jika MWA menilai bahwa ia tidak sanggup memenuhi tanggung jawabnya"),
      Text("K. Surat pernyataan bukan anggota suatu partai politik atau organisasi yang berafiliasi secara langsung dengan partai politik paling kurang 1 (satu) tahun sebelum pendaftaran (Form 2)"),
      Text("L. Surat pernyataan bebas dari kepentingan politik, ekonomi, maupun kepentingan pihak di luar UI lainnya yang bertentangan dengan kepentingan UI (Form 3)"),
      Text("M. Surat pernyataan tidak sedang berada dalam status sebagai tersangka ataupun terdakwa, serta tidak pernah dihukum berdasarkan putusan pengadilan yang berkekuatan hukum tetap (Form 4)"),
      Text("N. Surat pernyataan kesediaan pemeriksaan data pribadi oleh lembaga terkait (Form 5)"),
      Text("O. Dalam hal Bakal Calon Rektor yang merupakan anggota SA, anggota DGB, Rektor UI, dan/atau pejabat struktural lainnya di lingkungan UI, Bakal Calon harus menandatangani surat yang menyatakan untuk bersedia cuti dari keanggotaan SA, keanggotaan DGB, jabatan Rektor UI, dan/atau jabatan pejabat struktural di lingkungan UI jika ditetapkan menjadi Calon Rektor (Form 6A)"),
      Text("P. Dalam hal Bakal Calon Rektor yang masih menjabat sebagai Pejabat Struktural UI, Bakal Calon harus menandatangani surat yang menyatakan untuk tidak turut serta dalam proses pembahasan mengenai Pemilihan Rektor di MWA, SA, atau DGB (Form 6B)"),
      Text("Q. Dalam hal Bakal Calon Rektor merupakan pejabat struktural di luar lingkungan UI, Bakal Calon harus menandatangani surat yang menyatakan untuk bersedia mengundurkan diri dari jabatan pejabat struktural di luar lingkungan UI jika ditetapkan menjadi Rektor UI (Form 6C)"),
      Text("R. Formulir prestasi (Form 7)")
    ],
  ),
);
