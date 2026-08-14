abstract interface class LocalStorage {
  Future<void> save(Map<String, dynamic> json);

  Future<Map<String, dynamic>> load();
}
