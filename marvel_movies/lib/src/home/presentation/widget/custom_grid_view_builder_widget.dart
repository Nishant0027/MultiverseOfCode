import 'package:flutter/material.dart';

class CustomGridViewBuilderWidget<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, int) itemBuilder;
  const CustomGridViewBuilderWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 1.3 / 2,
      ),
      itemCount: items.length,
      itemBuilder: itemBuilder,
    );
  }
}
