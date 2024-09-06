import 'package:flutter/material.dart';
import 'package:myapp/users/screens/dokumen/components/pdf_api.dart';
import 'package:myapp/theme.dart';

class DokumenScreen extends StatelessWidget {
  const DokumenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          title: const Center(child: Text("Dokumen")),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () async {
                    const path =
                        'assets/pdf/75_Peraturan_RI_2021_Statuta_UI.pdf';
                    final file = await PDFApi.loadAsset(path);
                    // ignore: use_build_context_synchronously
                    openPDF(context, file);
                  },
                  child: const Text("Peraturan Statuta UI.pdf")),
              TextButton(
                  onPressed: () async {
                    const path = 'assets/pdf/RPJP_UI_2021_2035.pdf';
                    final file = await PDFApi.loadAsset(path);
                    // ignore: use_build_context_synchronously
                    openPDF(context, file);
                  },
                  child: const Text(
                      "Rencana Pembangunan Jangka Panjang UI 2015-2035.pdf")),
              TextButton(
                  onPressed: () async {
                    const path =
                        'assets/pdf/009_Keputusan_MWA_UI_2024 Kebijakan_Umum_Arah_Pengembangan_UI.pdf';
                    final file = await PDFApi.loadAsset(path);
                    // ignore: use_build_context_synchronously
                    openPDF(context, file);
                  },
                  child: const Text("Kebijakan Umum Arah Pengembangan UI.pdf")),
              TextButton(
                  onPressed: () async {
                    const path =
                        'assets/pdf/002_Peraturan_MWA_UI_2024_Pemilihan_Rektor_UI.pdf';
                    final file = await PDFApi.loadAsset(path);
                    // ignore: use_build_context_synchronously
                    openPDF(context, file);
                  },
                  child: const Text("Peraturan Pemilihan Rektor UI.pdf")),
              TextButton(
                  onPressed: () async {
                    const path =
                        'assets/pdf/004_Peraturan_MWA-UI_2024_Pemilihan_Rektor_UI.pdf';
                    final file = await PDFApi.loadAsset(path);
                    // ignore: use_build_context_synchronously
                    openPDF(context, file);
                  },
                  child: const Text(
                      "Perubahan Atas Peraturan Pemilihan Rektor UI 2024-2029.pdf")),
            ],
          ),
        ));
  }
}
