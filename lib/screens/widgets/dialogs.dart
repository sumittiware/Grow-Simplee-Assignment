import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grow_simplee_assignment/screens/home_screen.dart';
import 'package:grow_simplee_assignment/screens/widgets/button.dart';

class CustomDialogBox extends StatelessWidget {
  final Widget header;
  final CrossAxisAlignment bodyAlignment;
  final List<Widget> body;

  const CustomDialogBox({
    super.key,
    required this.header,
    required this.body,
    this.bodyAlignment = CrossAxisAlignment.start,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: header,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: bodyAlignment,
        children: body,
      ),
    );
  }
}

void showPopUpDialog(context) {
  showDialog(
    context: context,
    builder: (_) {
      return CustomDialogBox(
        header: const Text('Are you sure ?'),
        body: [
          const Text("If you exit, data of current rider will be lost"),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: 'Cancle',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: CustomButton(
                  title: 'Okay',
                  onTap: () {
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
              )
            ],
          ),
        ],
      );
    },
  );
}

void showDocumentDialog(context, File document) {
  showDialog(
    context: context,
    builder: (_) {
      return CustomDialogBox(
        header: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Preview'),
            IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close_rounded))
          ],
        ),
        body: [
          Expanded(
            child: Image.file(
              document,
              fit: BoxFit.fitHeight,
            ),
          )
        ],
      );
    },
  );
}
