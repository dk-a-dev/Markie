// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';

// class MarkdownEditor extends StatefulWidget {
//   final String filePath;

//   const MarkdownEditor({super.key, required this.filePath});

//   @override
//   State<MarkdownEditor> createState() => _MarkdownEditorState();
// }

// class _MarkdownEditorState extends State<MarkdownEditor> {
//   TextEditingController? controller;
//   String? _filePath;

//   @override
//   void initState() {
//     super.initState();
//     _filePath = widget.filePath;
//     _loadFileContent();
//   }

//   Future<void> _loadFileContent() async {
//     try {
//       final file = File(_filePath!);
//       final content = await file.readAsString();
//       controller = TextEditingController(text: content);
//     } catch (e) {
//       controller = TextEditingController(text: 'Error loading file: $e');
//     }
//     setState(() {});
//   }

//   Future<void> _saveFileContent() async {
//     try {
//       final file = File(_filePath!);
//       if (kDebugMode) {
//         print('FILE PATH');
//         print(file.absolute);
//       }
//       await file.writeAsString(controller?.text ?? '');
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text("File saved successfully"),
//       ));
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Error saving file: $e"),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Markdown Editor'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.save),
//             onPressed: _saveFileContent,
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height * 0.3,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Expanded(
//                 child: Markdown(
//                   data: controller?.text ?? '',
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextField(
//                 controller: controller,
//                 maxLines: null,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter markdown content...',
//                 ),
//                 onChanged: (text) {
//                   setState(() {});
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
