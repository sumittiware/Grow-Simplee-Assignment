import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grow_simplee_assignment/app/app_state.dart';
import 'package:grow_simplee_assignment/models/documents.dart';
import 'package:grow_simplee_assignment/screens/home_screen.dart';
import 'package:grow_simplee_assignment/screens/widgets/button.dart';
import 'package:grow_simplee_assignment/screens/widgets/dialogs.dart';
import 'package:grow_simplee_assignment/screens/widgets/document_tile.dart';
import 'package:provider/provider.dart';

class AddDocumentsScreen extends StatefulWidget {
  const AddDocumentsScreen({super.key});

  @override
  State<AddDocumentsScreen> createState() => _AddDocumentsScreenState();
}

class _AddDocumentsScreenState extends State<AddDocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showPopUpDialog(context);
        return false;
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Container(),
      title: const Text('Upload Documents'),
    );
  }

  Widget _buildBody() {
    return Consumer<AppState>(builder: (_, appState, __) {
      return Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  DocumentTile(
                    title: 'Aadhar Card',
                    onDocumentSelected: (File file) {
                      appState.addUserDocument(Document(
                        title: 'Aadhar Card',
                        documentFile: file,
                      ));
                    },
                  ),
                  DocumentTile(
                    title: 'Pan Card',
                    onDocumentSelected: (File file) {
                      appState.addUserDocument(Document(
                        title: 'Pan Card',
                        documentFile: file,
                      ));
                    },
                  ),
                  DocumentTile(
                    title: 'DL',
                    onDocumentSelected: (File file) {
                      appState.addUserDocument(Document(
                        title: 'DL',
                        documentFile: file,
                      ));
                    },
                  ),
                  DocumentTile(
                    title: 'Bank Cheque',
                    onDocumentSelected: (File file) {
                      appState.addUserDocument(Document(
                        title: 'Bank Cheque',
                        documentFile: file,
                      ));
                    },
                  ),
                  DocumentTile(
                    title: 'Photo',
                    onDocumentSelected: (File file) {
                      appState.addUserDocument(Document(
                        title: 'Photo',
                        documentFile: file,
                      ));
                    },
                  ),
                ],
              ),
            ),
          ),
          _buildButtonBar(),
        ],
      );
    });
  }

  Widget _buildButtonBar() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            title: 'Back',
            onTap: () => Navigator.pop(context),
          ),
        ),
        Consumer<AppState>(
          builder: (_, appState, __) {
            return Expanded(
              child: CustomButton(
                title: 'Save',
                onTap: () {
                  appState.addNewRider();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return const HomeScreen();
                      },
                    ),
                    (route) => false,
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
