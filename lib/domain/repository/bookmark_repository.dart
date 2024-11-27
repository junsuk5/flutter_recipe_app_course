abstract interface class BookmarkRepository {
  Future<void> save(int id);

  Future<void> unSave(int id);

  Future<void> toggle(int id);

  Future<List<int>> getBookmarkedIds();

  Future<void> clear();
}
