import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:myapp/theme.dart';
import 'package:path/path.dart';

class PdfViewerScreen extends StatefulWidget {
  final File file;
  const PdfViewerScreen({super.key, required this.file});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);

    return Scaffold(
        appBar: AppBar(
          leadingWidth: 40,
          backgroundColor: primaryColor,
          title: Text(name, style: const TextStyle(fontSize: 14),),
        ),
        body: PDFView(
          filePath: widget.file.path,
        ));
  }
}
