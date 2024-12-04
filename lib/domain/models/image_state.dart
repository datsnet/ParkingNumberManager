import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageState {
    String? path;
    List<String>? recognizedNumbers;
    String? recognizedNumber;
    ImageState({ 
      this.path,
      this.recognizedNumbers,
      this.recognizedNumber
    });
}

class ImageStateNotifier extends Notifier<ImageState> {

  String? path;
  String? recognizedNumber;
  @override
  ImageState build() {
    return ImageState(path: null, recognizedNumbers: null);
  }
  void setPath(String value) {
    state.path = value;
  }
}