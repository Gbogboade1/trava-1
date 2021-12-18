import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:trava/style/colors.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage({bool isGal = true}) async {
  try {
    final image = await ImagePicker().pickImage(
        source: isGal ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 80);
    if (image != null) return File(image.path);
    return null;
  } catch (e) {
    return null;
  }
}

Future<File?> cropImage(File imageFile) async {
  try {
    if (imageFile.existsSync()) {
      return await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ],
        androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'Modify Selected Image',
          toolbarColor: TravaColors.purple,
          toolbarWidgetColor: TravaColors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        cropStyle: CropStyle.rectangle,
        iosUiSettings: const IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      );
    }
    return null;
  } catch (_) {
    return null;
  }
}
