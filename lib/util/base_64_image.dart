// base64Image.dart
import 'dart:convert';
import 'package:flutter/material.dart';

extension Base64Image on String {
  Image decodeBase64Image() {
    return Image.memory(base64Decode(this));
  }
}