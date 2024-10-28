import 'package:flutter/material.dart';


class ExcelViewerScreen extends StatelessWidget {
  final List<List<String>> tableData;

  ExcelViewerScreen({required this.tableData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Excel Viewer")),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: tableData[0]
              .map((header) => DataColumn(label: Text(header)))
              .toList(),
          rows: tableData.skip(1).map((row) {
            return DataRow(
              cells: row.map((cell) => DataCell(Text(cell))).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}