import 'package:flutter_recipe_app_course/domain/repository/bookmark_repository.dart';

class MockBookmarkRepositoryImpl implements BookmarkRepository {
  final _ids = <int>{2, 4};

  @override
  Future<List<int>> getBookmarkedIds() async {
    return _ids.toList();
  }

  @override
  Future<void> save(int id) async {
    _ids.add(id);
  }

  @override
  Future<void> unSave(int id) async {
    _ids.remove(id);
  }

  @override
  Future<void> clear() async {
    _ids.clear();
  }

  @override
  Future<void> toggle(int id) async {
    if (_ids.contains(id)) {
      await unSave(id);
    } else {
      await save(id);
    }
  }
}
