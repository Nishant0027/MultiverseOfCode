import 'dart:ui';

import 'package:flutter/material.dart';

class LeadingButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final Widget? icon;

  /// Leading Button with optional parmaters for icon and onTap
  ///
  /// If onTap is null, it will pop the current screen. Else you'll have to add the pop navigation code in the onTap parameter.
  ///
  /// If icon is null, it will use default back arrow icon
  const LeadingButtonWidget({super.key, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Container(
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(30),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child:
              icon ??
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        ),
      ),
    );
  }
}
