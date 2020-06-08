import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
}
