import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';



final getPictureUseCaseProvider = Provider<GetPictureUseCase>((ref) {
  return GetPictureUseCase(
    ref: ref
  );
});


class GetPictureUseCase {
  GetPictureUseCase({
    required Ref ref,
  })  : _ref = ref;

  final Ref _ref;

  Future<String?> invoke({bool? isCamera}) async {
    var imageSource = ImageSource.gallery; 
    if (isCamera == true) {
      imageSource = ImageSource.camera;
    }
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    
    return pickedFile?.path;
  }
}