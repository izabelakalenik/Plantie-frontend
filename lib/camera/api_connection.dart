import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:logger/logger.dart';
import '../screens/result_screen.dart';

Future<Map<String, dynamic>?> sendImageToBackend(File imageFile) async {
  final uri = Uri.parse("http://10.0.2.2:8000/predict/"); // address of the emulator
  final request = http.MultipartRequest('POST', uri);
  var logger = Logger();

  request.files.add(
    await http.MultipartFile.fromPath(
      'file',
      imageFile.path,
      filename: basename(imageFile.path),
    ),
  );

  try {
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    logger.i("Response: ${response.body}");

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      logger.w("Error: ${response.statusCode} ${response.body}");
      return null;
    }
  } catch (e, stackTrace) {
    logger.e("Exception occurred while sending image", error: e, stackTrace: stackTrace);
    return null;
  }
}

void showResponse(BuildContext context, File imageFile, Map<String, dynamic> response) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => ResultScreen(image: imageFile, response: response),
    ),
  );
}
