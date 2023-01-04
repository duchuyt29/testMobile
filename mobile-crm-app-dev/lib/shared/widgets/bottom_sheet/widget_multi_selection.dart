import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../constants/colors.dart';

/// A bottom sheet widget containing either a classic checkbox style list
class WidgetMultiSelection<T> extends StatefulWidget
    with MultiSelectActions<T> {
  /// List of items to select from.
  final List<MultiSelectItem<T>> items;

  /// The list of selected values before interaction.
  final List<T> initialValue;

  /// Fires when the an item is selected / unselected.
  final void Function(List<T>)? onSelectionChanged;

  /// Set the initial height of the BottomSheet.
  final double? initialChildSize;

  /// Set the minimum height threshold of the BottomSheet before it closes.
  final double? minChildSize;

  /// Set the maximum height of the BottomSheet.
  final double? maxChildSize;

  /// Set the placeholder text of the search field.
  final String? searchHint;

  /// Moves the selected items to the top of the list.
  final bool separateSelectedItems;

  WidgetMultiSelection({
    required this.items,
    required this.initialValue,
    required this.onSelectionChanged,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.searchHint,
    this.separateSelectedItems = false,
  });

  @override
  _WidgetMultiSelectionState<T> createState() =>
      _WidgetMultiSelectionState<T>(items);
}

class _WidgetMultiSelectionState<T> extends State<WidgetMultiSelection<T>> {
  List<T> _selectedValues = [];
  List<MultiSelectItem<T>> _items;

  _WidgetMultiSelectionState(this._items);

  @override
  void initState() {
    super.initState();
    _selectedValues.addAll(widget.initialValue);

    for (var i = 0; i < _items.length; i++) {
      _items[i].selected = false;
      if (_selectedValues.contains(_items[i].value)) {
        _items[i].selected = true;
      }
    }

    if (widget.separateSelectedItems) {
      _items = widget.separateSelected(_items);
    }
  }

  /// Returns a CheckboxListTile
  Widget _buildListItem(MultiSelectItem<T> item) {
    return CheckboxListTile(
      value: item.selected,
      activeColor: AppColor.primaryColor,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) {
        setState(() {
          _selectedValues =
              widget.onItemCheckedChange(_selectedValues, item.value, checked!);

          if (checked) {
            item.selected = true;
          } else {
            item.selected = false;
          }
          if (widget.separateSelectedItems) {
            _items = widget.separateSelected(_items);
          }
        });
        if (widget.onSelectionChanged != null) {
          widget.onSelectionChanged!(_selectedValues);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    var filteredList = <MultiSelectItem<T>>[];
                    filteredList =
                        widget.updateSearchQuery(value, widget.items);
                    setState(() {
                      if (widget.separateSelectedItems) {
                        _items = widget.separateSelected(filteredList);
                      } else {
                        _items = filteredList;
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
}
