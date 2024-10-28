import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'screens/excel_viewer_screen.dart';
import 'screens/pdf_viewer_screen.dart';

class Utils {
  /// Open File Picker
  static Future<String?> selectFile(
      {required List<String> allowedExtensions}) async {
    print("Selecting file with extensions: $allowedExtensions");
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );

    if (result != null && result.files.single.path != null) {
      return result.files.single.path;
    } else {
      print("File selection canceled or failed.");
      return null;
    }
  }

  static Future<void> openPdfInApp(BuildContext context, String pdfPath) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PdfViewerScreen(pdfPath: pdfPath)),
    );
  }


  static Future<void> openExcelInApp(BuildContext context, String excelPath) async {
    // Load the Excel file and parse its contents
    final file = File(excelPath);
    final bytes = file.readAsBytesSync();
    final excel = Excel.decodeBytes(bytes);

    List<List<String>> tableData = [];

    for (var sheet in excel.tables.keys) {
      // Loop through rows in the sheet and extract data
      for (var row in excel.tables[sheet]!.rows) {
        List<String> rowData = [];
        for (var cell in row) {
          rowData.add(cell?.value.toString() ?? '');
        }
        tableData.add(rowData);
      }
      break; // If you want to load only the first sheet
    }

    // Navigate to the Excel Viewer screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExcelViewerScreen(tableData: tableData)),
    );
  }
}
