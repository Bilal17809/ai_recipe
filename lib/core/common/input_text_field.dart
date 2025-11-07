import 'package:flutter/material.dart';
import '../theme/app_styles.dart';
import '/core/common/common.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final VoidCallback googleSpeakButton;

  const InputTextField({
    super.key,
    required this.label,
    required this.onChanged,
    required this.controller,
    required this.googleSpeakButton
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      padding: const EdgeInsets.all(12),
      decoration:containerDecoration,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          TextField(
            controller: controller,
            maxLines: null,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: label,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(
                top: 8,
                left: 8,
                right: 32,
              ),
            ),
            onChanged: onChanged,
          ),

          // Clear icon
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller,
            builder: (context, value, _) {
              if (value.text.isEmpty) return const SizedBox.shrink();
              return Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                  },
                ),
              );
            },
          ),
          Positioned(
            bottom: 2,
            right: 8,
            child: Text(
              '200px area',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          Positioned(
            bottom:2,
            left: 0,
            right: 0,
            child: Center(
              child: GoogleSpeakBtn(onTap:googleSpeakButton,),
            ),
          ),
        ],
      ),
    );
  }
}
