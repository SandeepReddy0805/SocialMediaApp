import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final _imagePicker = ImagePicker();
  XFile? file = await _imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
}
