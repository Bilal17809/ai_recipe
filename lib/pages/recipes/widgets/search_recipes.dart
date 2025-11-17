import 'package:ai_recipe/core/common/common.dart';
import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class SearchRecipes extends StatelessWidget {
  const SearchRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: CustomTextFormField(
            hintText: "Search recipe",
            hintStyle: bodyLargeStyle.copyWith(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.withAlpha(100),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.withAlpha(100),
                width: 1,
              ),
            ),
          ),
        ),
        // SizedBox(width: 10),
        // _Buttons(icon: Icons.import_export,buTitle: "Sort",),
        // SizedBox(width: 10),
        // _Buttons(icon: Icons.filter,buTitle: "Filter",)
      ],
    );
  }
}

class _Buttons extends StatelessWidget {
  final IconData? icon;
  final String? buTitle;
  const _Buttons({super.key,this.icon,this.buTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,color: Colors.grey,),
        Text(buTitle!,style: titleSmallStyle.copyWith(color: Colors.grey),)
      ],
    );
  }
}
