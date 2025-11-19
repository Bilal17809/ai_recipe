import 'package:ai_recipe/core/common/bottomshet_header.dart';
import 'package:ai_recipe/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class VoiceImportSheet extends StatelessWidget {
  const VoiceImportSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          BottomSheetsHeader(
            title: "Voice Import",
            icon: Icons.mic,
            subTitle: "just speak it",
          ),
          SizedBox(height: 06),
          Container(
            height: 1,
            decoration: BoxDecoration(color: kBlack.withAlpha(20)),
          ),
          const SizedBox(height: 20),

          const Text(
            "Hit record and walk us through your recipe like you're chatting with a friend in the kitchen! We'll do the rest.",
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
          _MicRecordContainer(),
        ],
      ),
    );
  }
}

class _MicRecordContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: const [
          Icon(Icons.mic, size: 40),
          SizedBox(height: 12),
          Text("Click to start recording your recipe"),
        ],
      ),
    );
  }
}
