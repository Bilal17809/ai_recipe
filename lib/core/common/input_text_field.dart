import 'package:flutter/material.dart';
import '../theme/app_styles.dart';
import '/core/common/common.dart';



import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String)? onFieldSubmitted;
  final TextAlignVertical? textAlignVertical;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final int? MaxLine;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.MaxLine = 1,
    this.textAlignVertical,
    this.hintStyle,
    this.textDirection,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.obscureText = false,
    this.style,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
    this.suffixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      readOnly: readOnly,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: style,
      textAlign: textAlign,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      cursorColor: kBlack,
      onFieldSubmitted: onFieldSubmitted,
      // textAlignVertical: textAlignVertical ?? TextAlignVertical.center,

      // 👇 important changes
      maxLines: MaxLine,
      scrollPhysics: const BouncingScrollPhysics(),
      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        // isDense: true,
        hintText: hintText,
        hintStyle: hintStyle,
        maintainHintHeight: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: border ?? InputBorder.none,
        focusedBorder: focusedBorder ?? InputBorder.none,
        enabledBorder: enabledBorder ?? InputBorder.none,
        contentPadding:
        contentPadding ??
            const EdgeInsets.symmetric(horizontal: 02, vertical: 12),
      ),
    );
  }
}

//
// class InputTextField extends StatelessWidget {
//   final String label;
//   final ValueChanged<String> onChanged;
//   final TextEditingController controller;
//   final VoidCallback googleSpeakButton;
//
//   const InputTextField({
//     super.key,
//     required this.label,
//     required this.onChanged,
//     required this.controller,
//     required this.googleSpeakButton
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 210,
//       padding: const EdgeInsets.all(12),
//       decoration:containerDecoration,
//       child: Stack(
//         alignment: Alignment.topRight,
//         children: [
//           TextField(
//             controller: controller,
//             maxLines: null,
//             expands: true,
//             textAlignVertical: TextAlignVertical.top,
//             decoration: InputDecoration(
//               hintText: label,
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.only(
//                 top: 8,
//                 left: 8,
//                 right: 32,
//               ),
//             ),
//             onChanged: onChanged,
//           ),
//
//           // Clear icon
//           ValueListenableBuilder<TextEditingValue>(
//             valueListenable: controller,
//             builder: (context, value, _) {
//               if (value.text.isEmpty) return const SizedBox.shrink();
//               return Positioned(
//                 top: 0,
//                 right: 0,
//                 child: IconButton(
//                   icon: const Icon(Icons.close, size: 20),
//                   onPressed: () {
//                     controller.clear();
//                     onChanged('');
//                   },
//                 ),
//               );
//             },
//           ),
//           Positioned(
//             bottom: 2,
//             right: 8,
//             child: Text(
//               '200px area',
//               style: TextStyle(
//                 fontSize: 10,
//                 color: Colors.grey.shade500,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom:2,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: GoogleSpeakBtn(onTap:googleSpeakButton,),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
