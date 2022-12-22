import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickPage extends StatefulWidget {
  const FilePickPage({Key? key}) : super(key: key);

  @override
  State<FilePickPage> createState() => _FilePickPageState();
}

class _FilePickPageState extends State<FilePickPage> {
  String status = "";
  File? file;

  Future<File?> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload file"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                File? f = await selectFile();

                if (f != null) {
                  file = f;
                  setState(() {});
                }
              },
              child: const Text("Select file"),
            ),
            file != null
                ? SizedBox(height: 300, child: Image.file(file!))
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
