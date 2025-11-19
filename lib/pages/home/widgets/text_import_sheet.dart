import 'package:ai_recipe/core/common/common.dart';
import 'package:ai_recipe/core/common/common_button.dart';
import 'package:ai_recipe/core/theme/theme.dart';
import 'package:flutter/material.dart';
import '/core/common/bottomshet_header.dart';

class TextImportSheet extends StatelessWidget {
  const TextImportSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomSheetsHeader(
              title: "Text Import",
              icon: Icons.text_fields_sharp,
              subTitle: "Type or paste",
            ),
            SizedBox(height: 06),
            Container(
              height: 1,
              decoration: BoxDecoration(color: kBlack.withAlpha(20)),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              hintText: "Enter your recipe...",
              hintStyle: bodyMediumStyle.copyWith(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 08,vertical: 10),
              MaxLine: 10,
            ),

            const SizedBox(height: 10),
            Text(
              "Include ingredients, instructions, servings, cook time, and any any special notes.",
            ),
            const SizedBox(height: 20),
            _TipsBox(),
            const SizedBox(height: 20),
            Container(
              height: 1,
              decoration: BoxDecoration(color: kBlack.withAlpha(20)),
            ),
            const SizedBox(height: 14),
           CommonButton(text: "Import recipe")
          ],
        ),
      ),
    );
  }
}

class _TipsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline, size: 20),
              SizedBox(width: 6),
              Text(
                "Tips for better results:",
                style: bodyLargeStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          _TextTitle(title: "Include ingredient quantities and measurements"),
          _TextTitle(title: "List Cocking steps in order"),
          _TextTitle(title: "Add prep/cook times and serving size"),
          // Text("• Add prep/cook times and serving size"),
        ],
      ),
    );
  }
}

class _TextTitle extends StatelessWidget {
  final String? title;
  const _TextTitle({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      "• $title",
      style: bodyMediumStyle.copyWith(color: Colors.blue),
    );
  }
}
