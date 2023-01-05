import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:grow_simplee_assignment/screens/widgets/button.dart';
import 'package:grow_simplee_assignment/screens/widgets/dialogs.dart';

class DocumentTile extends StatefulWidget {
  final String title;
  final Function(File) onDocumentSelected;

  const DocumentTile({
    super.key,
    required this.title,
    required this.onDocumentSelected,
  });

  @override
  State<DocumentTile> createState() => _DocumentTileState();
}

class _DocumentTileState extends State<DocumentTile> {
  File? _pickedFile;

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _pickedFile = File(image!.path);
    });

    widget.onDocumentSelected(_pickedFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Checkbox(
            value: _pickedFile != null,
            onChanged: (value) {},
          ),
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Row(
            children: [
              CustomButton(
                title: 'View',
                onTap: () => showDocumentDialog(context, _pickedFile!),
                outlined: true,
                enable: _pickedFile != null,
              ),
              CustomButton(
                title: 'Add',
                onTap: pickImage,
                outlined: true,
                enable: true,
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}
