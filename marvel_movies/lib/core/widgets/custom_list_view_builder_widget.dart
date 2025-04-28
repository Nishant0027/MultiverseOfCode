import 'package:flutter/material.dart';

class CustomListViewBuilderWidget extends StatelessWidget {
  final List items;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Axis scrollDirection;

  /// A custom ListView builder widget that allows for a flexible item builder
  /// and scroll direction.
  ///
  /// This widget is useful for creating lists of items with a custom layout
  /// and behavior.
  ///
  ///  It takes a list of items and a function to build each item
  /// based on the index.
  ///
  /// Example usage:
  /// ```dart
  /// CustomListViewBuilderWidget(
  ///   items: myItems,
  ///   itemBuilder: (context, index) {
  ///     return MyCustomItemWidget(item: myItems[index]);
  ///   },
  /// )
  /// ```
  const CustomListViewBuilderWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: scrollDirection,
      itemCount: items.length,
      itemBuilder: itemBuilder,
    );
  }
}
