import 'package:flutter/material.dart';
import 'package:navoiy/models/data_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';

class ViewScreen extends StatelessWidget {
  final Book book;
  const ViewScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    print(book);
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(book.name, style: largeTextStyle()),
        backgroundColor: background,
        iconTheme: const IconThemeData(
          color: light,
        ),
      ),
      body: SfPdfViewer.asset(
        book.path,
      ),
    );
  }
}
