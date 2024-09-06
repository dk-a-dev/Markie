import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markie/markdown_editor.dart';

class MarkdownViewer extends StatelessWidget {
  final String filePath;

  const MarkdownViewer({super.key, required this.filePath});

  Future<String> _readMarkdownFile(String path) async {
    try {
      final file = File(path);
      return await file.readAsString();
    } catch (e) {
      return 'Error reading file: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Markdown Viewer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MarkdownEditor(filePath: filePath),
              //   ),
              // );
            },
          ),
        ],
      ),
      body: FutureBuilder<String>(
        future: _readMarkdownFile(filePath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Markdown(
              data: snapshot.data ?? 'Empty file',
            );
          }
        },
      ),
    );
  }
}
