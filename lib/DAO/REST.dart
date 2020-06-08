import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:multipart_request/multipart_request.dart';

String SERVER_URL = "";
String LOCALHOST_URL = "http://192.168.0.24:8081";
Dio dio = new Dio();
// Useful websites:
// https://dev.to/carminezacc/advanced-flutter-networking-part-1-uploading-a-file-to-a-rest-api-from-flutter-using-a-multi-part-form-data-post-request-2ekm
class BackendDAO{
  FormData formData = new FormData();


  Future<bool> sendFile(File image) async {
    Uint8List bytes = image.readAsBytesSync();
    var request = http.MultipartRequest('POST', Uri.parse(LOCALHOST_URL+'/Image'));
    request.files.add(
        http.MultipartFile(
            'picture',
            image.readAsBytes().asStream(),
            image.lengthSync(),
        )
    );
    var response = await request.send();
    print("response: "+response.statusCode.toString());
    if (response.statusCode == 200) {
      return true;
    }
    else {
      print('Error');
      return false;
    }
  }
  void sendRequest(String imagePath) {
    var request = MultipartRequest();

    request.setUrl("https://192.168.1.98:8081/Image");
    request.addFile("image", imagePath);

    var response = request.send();

    response.onError = () {
      print("Error");
    };

    response.onComplete = (response) {
      print(response);
    };

    response.progress.listen((int progress) {
      print("progress from response object " + progress.toString());
    });
  }

  void multipart(String imagePath) async {
    var request = http.MultipartRequest('POST', Uri.parse(LOCALHOST_URL+'/Image'));
    request.files.add(
        await http.MultipartFile.fromPath(
            'picture',
            imagePath
        )
    );
    var res = await request.send();
  }
}
