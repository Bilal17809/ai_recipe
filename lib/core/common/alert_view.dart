import 'package:flutter/material.dart';

class AlertView extends StatelessWidget {
  final String title;
  final String message;
  final String okTitle;
  final String? cancelTitle;

  const AlertView({
    super.key,
    required this.title,
    required this.message,
    this.okTitle = 'OK',
    this.cancelTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          const SizedBox(height: 12),
          Text(message),
          const SizedBox(height: 20),
          Row(
            spacing: 12,
            children: [
              if (cancelTitle != null)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(cancelTitle!),
                  ),
                ),
              Expanded(
                child: FilledButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(okTitle),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
