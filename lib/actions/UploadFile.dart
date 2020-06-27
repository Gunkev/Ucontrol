import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadFile {
  List<File> imageList = [];
  File image;
  final picker = ImagePicker();

  // get file from gallery
  openImage() async {
    final imageFile = await picker.getImage(source: ImageSource.gallery);
    upload(){
      image = File(imageFile.path);
      imageList.add(image);
    }
  }

  // get image from camera
  openCamera() async {
    final imageFile = await picker.getImage(source: ImageSource.camera);
    upload() {
      image = File(imageFile.path);
      imageList.add(image);
    }
  }
}