import 'dart:io';
import 'package:ai_recipe/core/common/common_button.dart';
import 'package:ai_recipe/core/common/loading.dart';
import 'package:ai_recipe/core/theme/app_styles.dart';
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
          SizedBox(height: 18),
          Container(height: 1, color: kBlack.withAlpha(20)),
          const SizedBox(height: 24),
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
                    onTap: notifier.selectedCamera,
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
                    onTap: notifier.selectUpload,
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
          Column(
            children: [
              const SizedBox(height: 20),
              if (state.mode == ImportMode.camera)
                CameraModeWidget(
                  selectedImage: state.selectedImage,
                  onCapture: notifier.pickFromCamera,
                  onRetake: notifier.pickFromCamera,
                )
              else if (state.mode == ImportMode.upload)
                UploadModeWidget(
                  selectedImage: state.selectedImage,
                  onPick: notifier.pickFromGallery,
                ),
              const SizedBox(height: 20),
              if (state.selectedImage != null)
                CommonButton(
                  text: "Import recipe",
                  leadingIcon: Icons.camera_alt_outlined,
                ),
            ],
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
        border: Border.all(color: active ? appColorDeepPurple : Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: active ? appColorDeepPurple : null, size: 20),
          const SizedBox(width: 6),
          Text(
            text,
            style: bodyMediumStyle.copyWith(
              color: active ? appColorDeepPurple : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _CameraPreviewBox extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    return Container(
      height: 240,
      width: double.infinity,
      decoration: roundedDecoration.copyWith(
        color: Colors.black,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Builder(
          builder: (_) {
            if (state.isLoading) {
              return ImageUploadLoading();
            }
            if (state.selectedImage != null) {
              return Image.file(
                state.selectedImage!,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              );
            }
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    state.mode == ImportMode.camera
                        ? Icons.camera_alt
                        : Icons.photo_library,
                    size: 50,
                    color: kWhite,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    state.mode == ImportMode.camera
                        ? "Tap camera to take snapshot"
                        : "Tap camera to upload from gallery",
                    style: bodyMediumStyle.copyWith(color: kWhite),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CameraModeWidget extends StatelessWidget {
  final File? selectedImage;
  final Future<void> Function() onCapture;
  final Future<void> Function() onRetake;
  const CameraModeWidget({
    required this.selectedImage,
    required this.onCapture,
    required this.onRetake,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: selectedImage != null ? null : onCapture,
          child: _CameraPreviewBox(),
        ),
        const SizedBox(height: 02),
        if (selectedImage == null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 06),
            child: Text(
              "Position your recipe or ingredients in the frame and tap the camera button",
              style: bodyMediumStyle,
              textAlign: TextAlign.center,
            ),
          ),
        SizedBox(height: 18),
        if (selectedImage == null) SizedBox(height: 80),
        if (selectedImage != null)
          GestureDetector(
            onTap: onRetake,
            child: Container(
              width: 130,
              padding: EdgeInsets.all(6),
              // margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: roundedDecoration.copyWith(
                color: kWhite,
                border: Border.all(color: appColorDeepPurple),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.refresh, color: appColorDeepPurple),
                  SizedBox(width: 08),
                  Text("Retake", style: TextStyle(color: appColorDeepPurple)),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class UploadModeWidget extends StatelessWidget {
  final File? selectedImage;
  final Future<void> Function() onPick;

  const UploadModeWidget({required this.selectedImage, required this.onPick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(onTap: onPick, child: _CameraPreviewBox()),
        if (selectedImage == null) SizedBox(height: 152),
      ],
    );
  }
}
