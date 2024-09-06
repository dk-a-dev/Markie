import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:markie/markdown_editor.dart';
import 'package:markie/markdown_viewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedFilePath;

  Future<void> _pickMarkdownFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['md'],
    );

    if (result != null) {
      setState(() {
        _selectedFilePath = result.files.single.path;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MarkdownViewer(filePath: _selectedFilePath!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Markie'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Markdown File'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Editor in Production"),
                ));
                Navigator.pop(context);
                // if (_selectedFilePath != null) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) =>
                //           MarkdownEditor(filePath: _selectedFilePath!),
                //     ),
                //   );
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //     content: Text("No file selected"),
                //   ));
                // }
              },
            ),
            ListTile(
              leading: const Icon(Icons.file_open),
              title: const Text('Open Markdown File'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _pickMarkdownFile(); // Open file picker
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Select a Markdown file to view'),
      ),
    );
  }
}
