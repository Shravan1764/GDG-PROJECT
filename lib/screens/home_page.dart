import 'package:flutter/material.dart';

import '../utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> onPdfViewerPressed() async {
    String? pdfFilePath = await Utils.selectFile(allowedExtensions: ['pdf']);
    if (pdfFilePath != null && context.mounted) {
      await Utils.openPdfInApp(context, pdfFilePath);
    }
  }

  Future<void> onExcelViewerPressed() async {
    String? excelFilePath = await Utils.selectFile(allowedExtensions: ['xlsx']);
    if (excelFilePath != null && context.mounted) {
      await Utils.openExcelInApp(context, excelFilePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Document Viewer",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          Text(
            "Please select the type of file to view",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          ElevatedButton(
            onPressed: onPdfViewerPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).colorScheme.onSecondary,
            ),
            child: const Text("PDF Viewer"),
          ),
          ElevatedButton(
            onPressed: onExcelViewerPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).colorScheme.onSecondary,
            ),
            child: const Text("Excel File Viewer"),
          ),
        ],
      ),
    );
  }
}
