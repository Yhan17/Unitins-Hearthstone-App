class AppPipes {
  static String replaceHtmlTags(String text) {
    final formattedString = text.replaceAll('<b>', '').replaceAll('</b>', '');

    return formattedString;
  }
}
