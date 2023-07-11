import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Minggu15Provider extends ChangeNotifier {
  bool _isImageLoaded = false;
  bool get isImageLoaded => _isImageLoaded;

  set setIsImageLoaded(val) {
    _isImageLoaded = val;
    notifyListeners();
  }

  bool _isPost = false;
  bool get isPost => _isPost;

  set setPost(bool? value) {
    _isPost = true;
    notifyListeners();
  }

  set setUnPost(bool? value) {
    _isPost = false;
    notifyListeners();
  }

  // ImagePicker
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _img;
  XFile? get img => _img;

  set setImg(XFile? value) {
    _img = value;
    notifyListeners();
  }

  List<XFile>? _listImg = [];
  List<XFile>? get listImg => _listImg;

  void ulangi() {
    _isPost = false;
    _listImg = [];
    notifyListeners();
  }

  void setListImg(List<XFile>? value) {
    if (_listImg == null) {
      _listImg = value;
    } else {
      _listImg!.addAll(value!);
    }
    _isPost = false;
    notifyListeners();
  }

  pickImage(bool isGalleryImage) async {
    try {
      var res = await _imagePicker.pickImage(
          source: isGalleryImage == true
              ? ImageSource.gallery
              : ImageSource.camera);
      if (res != null) {
        setImg = res;
        print(res);
        setIsImageLoaded = true;
      }
    } catch (e) {
      setIsImageLoaded = false;
      print(e.toString());
    }
  }
}
