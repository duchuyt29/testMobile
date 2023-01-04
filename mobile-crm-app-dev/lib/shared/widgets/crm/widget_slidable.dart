import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CrmWidgetSlidable extends StatelessWidget {
  const CrmWidgetSlidable({
    Key? key,
    required this.child,
    this.startActions,
    this.endActions,
  }) : super(key: key);

  final Widget child;
  final ActionPane? startActions;
  final ActionPane? endActions;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),
      // The start action pane is the one at the left or the top side.
      startActionPane: startActions,
      // The end action pane is the one at the right or the bottom side.
      endActionPane: endActions,
      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: child,
    );
  }
}
