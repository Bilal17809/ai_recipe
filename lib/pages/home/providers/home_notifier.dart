import 'package:ai_recipe/core/common/enums/import_mode.dart';
import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'home_state.dart';
part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    return HomeState();
  }
  void selectedCamera(){
    state = state.copyWith(mode: ImportMode.camera);
    if (state.isInitialized == true) return;
    initializeCamera();
  }

  void selectUpload(){
    state.camController?.dispose();
    state = state.copyWith(
      mode: ImportMode.upload,
      camController: null,
      isInitialized: false,
    );
  }


  Future<void> initializeCamera() async {
    try {
      state = state.copyWith(isLoading: true);
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: "No camera found",
        );
        return;
      }
      final controller = CameraController(
        cameras.first,
        ResolutionPreset.medium,
        enableAudio: false,
      );
      await controller.initialize();
      state = state.copyWith(
        camController: controller,
        isInitialized: true,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  void dispose() {
    state.camController?.dispose();
    
  }
}
