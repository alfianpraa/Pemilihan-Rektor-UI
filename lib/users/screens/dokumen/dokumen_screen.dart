import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/users/screens/dokumen/components/pdf_api.dart';
import 'package:myapp/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DokumenScreen extends StatefulWidget {
  const DokumenScreen({super.key});

  @override
  State<DokumenScreen> createState() => _DokumenScreenState();
}

class _DokumenScreenState extends State<DokumenScreen> {
  bool isLoading = false;

  Future<void> _downloadDocx() async {
    setState(() {
      isLoading = true; // Stop loading
    });
    // Request storage permission if necessary
    if (await Permission.storage.request().isGranted) {
      try {
        // Load the DOCX file from assets
        final ByteData data =
            await rootBundle.load('assets/form/template.docx');
        final Uint8List bytes = data.buffer.asUint8List();

        // Get the application's document directory
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/template.docx';
        final file = File(filePath);

        // Write the file to the document directory
        await file.writeAsBytes(bytes);

        // Show a message or perform other actions upon successful save
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File saved to $filePath')),
        );
      } catch (e) {
        print('Error saving file: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } else {
      // Handle the case where the user did not grant storage permission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Storage permission is required')),
      );
    }

    setState(() {
      isLoading = false; // Stop loading
    });
  }

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
                  const path = 'assets/pdf/75_Peraturan_RI_2021_Statuta_UI.pdf';
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Download Form", style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Surat Pernyataan", style: TextStyle(fontSize: 16)),
                  isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(50, 30)),
                          onPressed: () {
                            _downloadDocx();
                          },
                          child: Text("Download"),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
