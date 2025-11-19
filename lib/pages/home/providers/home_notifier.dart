import 'dart:io';
import 'package:ai_recipe/core/common/enums/import_mode.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'home_state.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    return const HomeState();
  }

  final ImagePicker _picker = ImagePicker();


  void selectedCamera() {
    if (state.mode != ImportMode.camera) {
      state = state.copyWith(
        mode: ImportMode.camera,
        selectedImage: null,
      );
    }

  }

  void selectUpload() {
    if (state.mode != ImportMode.upload) {
      state = state.copyWith(
        mode: ImportMode.upload,
        selectedImage: null,
      );
    }
  }


  Future<void> pickFromCamera() async {
    try {
      state = state.copyWith(isLoading: true, selectedImage: null);
      await Future.delayed(Duration(seconds: 1));
      final image = await _picker.pickImage(
          source: ImageSource.camera, maxWidth: 1080, imageQuality: 80);
      if (image != null) {
        state =
            state.copyWith(selectedImage: File(image.path), isLoading: false);
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> pickFromGallery() async {
    try {
      state = state.copyWith(isLoading: true, selectedImage: null);
      await Future.delayed(Duration(seconds: 1));
      final image = await _picker.pickImage(
          source: ImageSource.gallery, maxWidth: 1080, imageQuality: 80);
      if (image != null) {
        state =
            state.copyWith(selectedImage: File(image.path), isLoading: false);
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}
