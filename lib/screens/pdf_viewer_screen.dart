import 'package:pdfx/pdfx.dart';
import 'package:flutter/material.dart';

class PdfViewerScreen extends StatelessWidget {
  final String pdfPath;

  PdfViewerScreen({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PDF Viewer")),
      body: PdfView(
        controller: PdfController(
          document: PdfDocument.openFile(pdfPath),
        ),
      ),
    );
  }
}

