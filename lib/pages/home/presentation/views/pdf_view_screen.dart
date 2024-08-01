import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class PdfViewScreen extends StatefulWidget {
  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  bool _isLoading = true;
  PDFDocument? document;
  @override
  void initState() {
    loadDocument();

    super.initState();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/policy.pdf');

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : PDFViewer(document: document!),
      ),
    );
  }
}
