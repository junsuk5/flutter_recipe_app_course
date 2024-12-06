import 'dart:async';

import 'package:flutter_recipe_app_course/domain/repository/bookmark_repository.dart';
import 'package:rxdart/rxdart.dart';

class MockBookmarkRepositoryImpl implements BookmarkRepository {
  final _ids = <int>{2, 3};
  final _controller = BehaviorSubject<Set<int>>();

  MockBookmarkRepositoryImpl() {
    _controller.add(_ids);
  }

  @override
  Future<List<int>> getBookmarkedIds() async {
    return _ids.toList();
  }

  @override
  Future<void> save(int id) async {
    _ids.add(id);
    _controller.add(_ids);
  }

  @override
  Future<void> unSave(int id) async {
    _ids.remove(id);
    _controller.add(_ids);
  }

  @override
  Future<void> clear() async {
    _ids.clear();
    _controller.add(_ids);
  }

  @override
  Future<void> toggle(int id) async {
    if (_ids.contains(id)) {
      await unSave(id);
    } else {
      await save(id);
    }
    _controller.add(_ids);
  }

  @override
  Stream<Set<int>> bookmarkIdsStream() {
    return _controller.stream;
  }
}
