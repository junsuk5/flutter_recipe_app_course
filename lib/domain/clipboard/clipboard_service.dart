abstract interface class ClipboardService {
  Future<void> copyText(String text);

  Future<String?> getText();
}
