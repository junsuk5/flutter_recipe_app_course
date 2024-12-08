import 'package:flutter/services.dart';
import 'package:flutter_recipe_app_course/domain/clipboard/clipboard_service.dart';

class DefaultClipboardService implements ClipboardService {
  @override
  Future<void> copyText(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Future<String?> getText() async {
    final clipboardData = await Clipboard.getData('text/plain');
    return clipboardData?.text;
  }
}
