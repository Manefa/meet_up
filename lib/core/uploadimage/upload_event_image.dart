import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

Future<String> uploadFile(File _image) async {
  String returnURL;
  Reference storageReference = FirebaseStorage.instance
      .ref()
      .child('EVENTSIMAGES/${basename(_image.path)}');
  UploadTask uploadTask = storageReference.putFile(_image);
  await uploadTask.whenComplete(() async => {
        await storageReference.getDownloadURL().then((fileURL) {
      returnURL =  fileURL;
    }),
  });
  return returnURL;
}