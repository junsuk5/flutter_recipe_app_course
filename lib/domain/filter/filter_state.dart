class FilterState {
  final String time;
  final int rate;
  final String category;

  const FilterState({
    required this.time,
    required this.rate,
    required this.category,
  });

  FilterState copyWith({
    String? time,
    int? rate,
    String? category,
  }) {
    return FilterState(
      time: time ?? this.time,
      rate: rate ?? this.rate,
      category: category ?? this.category,
    );
  }
}