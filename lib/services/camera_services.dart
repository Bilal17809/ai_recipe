import 'package:camera/camera.dart';

class CameraService {

  CameraController? _controller;
  CameraController? get controller => _controller;

  Future<CameraController> initialize() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      throw Exception("No camera found");
    }
    _controller = CameraController(
      cameras.first,
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await _controller!.initialize();
    return _controller!;
  }

  void dispose() {
    _controller?.dispose();
    _controller = null;
  }
}
