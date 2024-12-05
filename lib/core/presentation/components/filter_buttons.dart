import 'package:flutter/material.dart';

import 'filter_button.dart';

class FilterButtons extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final void Function(String item) onSelected;

  const FilterButtons({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: items.expand((e) {
        return [
          GestureDetector(
            onTap: () => onSelected(e),
            child: FilterButton(e, isSelected: e == selectedItem),
          ),
          const SizedBox(width: 10),
        ];
      }).toList(),
    );
  }
}
