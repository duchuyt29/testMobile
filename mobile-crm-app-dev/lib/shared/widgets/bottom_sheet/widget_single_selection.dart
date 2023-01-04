import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiengviet/tiengviet.dart';

import '../../constants/colors.dart';

/// A bottom sheet widget containing either a classic checkbox style list
class WidgetSingleSelection<T> extends StatefulWidget {
  /// List of items to select from.
  final List<SingleSelectionItem<T>> items;

  /// The list of selected values before interaction.
  final T? initialValue;

  /// Fires when the an item is selected
  final void Function(T)? onSelectionChanged;

  /// Set the initial height of the BottomSheet.
  final double? initialChildSize;

  /// Set the minimum height threshold of the BottomSheet before it closes.
  final double? minChildSize;

  /// Set the maximum height of the BottomSheet.
  final double? maxChildSize;

  /// Set the placeholder text of the search field.
  final String? searchHint;

  WidgetSingleSelection({
    required this.items,
    required this.onSelectionChanged,
    this.initialValue,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.searchHint,
  });

  @override
  _WidgetSingleSelectionState<T> createState() =>
      _WidgetSingleSelectionState<T>(items);
}

class _WidgetSingleSelectionState<T> extends State<WidgetSingleSelection<T>> {
  T? _selected;
  List<SingleSelectionItem<T>> _items;

  _WidgetSingleSelectionState(this._items);

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
        initialChildSize: widget.initialChildSize ?? 0.4,
        minChildSize: widget.minChildSize ?? 0.4,
        maxChildSize: widget.maxChildSize ?? 0.8,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        _items = widget.items;
                      } else {
                        _items = widget.items
                            .where((element) => element.isCompare(value))
                            .toList();
                      }
                    });
                  },
                  decoration: InputDecoration(
                    hintText: widget.searchHint ?? 'search'.tr,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 26,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return _buildListItem(_items[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Returns a CheckboxListTile
  Widget _buildListItem(SingleSelectionItem<T> item) {
    return RadioListTile<T>(
      groupValue: _selected,
      value: item.value,
      activeColor: AppColor.primaryColor,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) {
        if (checked == null) {
          return;
        }
        setState(() {
          _selected = checked;
        });
        if (widget.onSelectionChanged != null) {
          widget.onSelectionChanged!(checked);
        }
        Future.delayed(
          const Duration(milliseconds: 300),
          () => Get.back(result: checked),
        );
      },
    );
  }
}

class SingleSelectionItem<T> {
  final T value;
  final String label;

  SingleSelectionItem(this.value, this.label);

  bool isCompare(String searchText) {
    return TiengViet.parse(label)
        .toLowerCase()
        .contains(TiengViet.parse(searchText).toLowerCase());
  }
}
