import 'package:ai_recipe/extension/extension.dart';
import 'package:flutter/material.dart';
import '/core/theme/app_colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool isBackButton;
  final bool isCenter;
  final bool showConnectivityIcon;
  final VoidCallback? onTap;

  const MainAppBar({
    super.key,
    required this.title,
    this.actions,
    this.isBackButton = false,
    this.isCenter = false,
    this.showConnectivityIcon = true,
    this.onTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isCenter,
      backgroundColor:kWhiteF7,
      leading: isBackButton
          ? Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios,),
          onPressed: onTap,
        ),
      )
          : null,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.headlineSmall?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
