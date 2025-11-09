class UrlHelper {
  /// Converts localhost URLs to emulator-friendly URLs
  static String getFullImageUrl(String url) {
    if (url.isEmpty) return '';

    // For Android emulator
    if (url.startsWith('http://127.0.0.1')) {
      return url.replaceFirst('http://127.0.0.1', 'http://10.0.2.2');
    }

    return url; // keep original for real devices or external URLs
  }
}
