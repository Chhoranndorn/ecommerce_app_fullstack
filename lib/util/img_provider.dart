import 'package:flutter/material.dart';

class Img {
  static ImageProvider provider(String src) {
    if (src.startsWith('http://') || src.startsWith('https://')) {
      return NetworkImage(src);
    }
    return AssetImage(src);
  }

  static Widget widget(
    String src, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    BorderRadius? borderRadius,
  }) {
    final img =
        Image(image: provider(src), width: width, height: height, fit: fit);
    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius, child: img);
    }
    return img;
  }
}
