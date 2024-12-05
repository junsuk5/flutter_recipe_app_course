import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<String> categories,
    @Default('All') String selectedCategory,
  }) = _HomeState;
}