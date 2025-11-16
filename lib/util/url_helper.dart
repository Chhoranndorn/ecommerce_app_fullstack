// lib/utils/url_helper.dart
import 'dart:io';

String buildImageUrl(String path) {
  if (path.isEmpty) return '';

  String host;
  if (Platform.isAndroid) {
    host = 'http://10.0.2.2:8000';
    // host = 'http://127.0.0.1:8000';
  } else if (Platform.isIOS) {
    host = 'http://127.0.0.1:8000';
  } else {
    host = 'http://192.168.0.152:8000'; // replace with your PC LAN IP
  }
  // Add a slash if the path doesn't start with one
  if (!path.startsWith('/')) {
    path = '/$path';
  }
  return '$host$path';
}
