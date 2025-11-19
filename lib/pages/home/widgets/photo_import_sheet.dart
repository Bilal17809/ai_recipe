import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '/core/common/bottomshet_header.dart';
import '/core/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_recipe/core/common/enums/import_mode.dart';
import 'package:ai_recipe/pages/home/providers/home_notifier.dart';

class PhotoImportSheet extends ConsumerWidget {
  final VoidCallback onUploadTap;
  const PhotoImportSheet({super.key, required this.onUploadTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(homeProvider);
    final notifier = ref.read(homeProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetsHeader(
            title: "Photo Import",
            icon: Icons.camera_alt_outlined,
            subTitle: "Snap and extract",
          ),

          SizedBox(height: 06),

          Container(
            height: 1,
            decoration: BoxDecoration(color: kBlack.withAlpha(20)),
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(04),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.withAlpha(60), width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () => notifier.selectedCamera(),
                    child: _Tab(
                      "Camera",
                      Icons.camera_alt,
                      active: state.mode == ImportMode.camera,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: GestureDetector(
                    onTap: () => notifier.selectUpload(),
                    child: _Tab(
                      "Upload",
                      Icons.upload,
                      active: state.mode == ImportMode.upload,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              if (state.mode == ImportMode.upload) {
                onUploadTap();
              }
            },
            child: _CameraPreviewBox(
              // isUpload: state.mode == ImportMode.upload,
            ),
          ),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool active;
  _Tab(this.text, this.icon, {this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(08),
      decoration: BoxDecoration(
        color: active ? appColorDeepPurple.withAlpha(40) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: active ? appColorDeepPurple : Colors.white,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: active ? appColorDeepPurple : null,size: 20,),
          const SizedBox(width: 6),
          Text(
            text,
            style: bodyMediumStyle.copyWith( color: active ? appColorDeepPurple : null,)


          ),
        ],
      ),
    );
  }
}

class _CameraPreviewBox extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final cam = ref.watch(homeProvider);

    if (cam.isLoading) {
      return Container(
        height: 220,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    }

    if (cam.isInitialized != true) {
      return Container(
        height: 220,
        alignment: Alignment.center,
        child: const Text("Camera not initialized"),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CameraPreview(cam.camController!),
    );

  }
}

