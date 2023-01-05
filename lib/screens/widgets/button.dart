import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool enable;
  final bool outlined;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.enable = true,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: OutlinedButton(
        onPressed: (enable) ? onTap : null,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(12),
          side: BorderSide(
            color: (enable) ? Colors.deepPurple : Colors.deepPurple.shade200,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: (!outlined)
              ? (enable)
                  ? Colors.deepPurple
                  : Colors.deepPurple.shade200
              : Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: (outlined) ? Colors.deepPurple : Colors.white,
          ),
        ),
      ),
    );
  }
}
